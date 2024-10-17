import Foundation
import ZTronRouter
import os

// BY DESIGN CHOICE, PRIVATE METHODS DO NOT WAIT OR SIGNAL SEMAPHORES. IT'S THE CLIENT RESPONSIBILITY TO DO SO.
public final class QuestModel: ObservableObject, @unchecked Sendable {
    private static let logger = Logger(subsystem: "com.zombietron.uniforms", category: "challenges model")
    
    
    private var routes: ZTronRouter<Empty, QuestsPositionMapper, Empty>
    
    @Published private var selectedChips: [[ZTronNavigator.PathComponents]]
    private var allChips: [[ZTronNavigator.PathComponents]]
    
    private let routesLock: DispatchSemaphore = .init(value: 1)
    private let selectedChipsLock: DispatchSemaphore = .init(value: 1)
    
    /// Initialized a selection of chips from the specified router and initial chips, and validates it.
    ///
    /// Validating the initial chips consists in the following behavior:
    ///
    /// 1. All the chips must be valid routes in the tree, with associated quests.
    /// 2. The first level of chips (depth 0) must have at most one selected chip.
    /// 3. All the chips at depth > 0 must be in the subtree with root in the selected chip at depth 0.
    ///
    /// If the inputs can't be validated, nil is returned instead.
    public init?(
        routes: ZTronRouter<Empty, QuestsPositionMapper, Empty>,
        withInitialChips: [ZTronNavigator.PathComponents] = []
    ) {
        self.routes = routes
        
        var tempSelectedChips = [[ZTronNavigator.PathComponents]].init(repeating: [], count: routes.getMaxDepth() + 1)
        var initialChips = [[ZTronNavigator.PathComponents]].init(repeating: [], count: routes.getMaxDepth() + 1)
                
        // Validation 1.
        for i in 0..<withInitialChips.count {
            if (routes.peek(at: withInitialChips[i]) != nil) {
                tempSelectedChips[withInitialChips[i].count - 2].append(withInitialChips[i])
                
                routes.forEachNeighbour(of: withInitialChips[i]) { path, _ in
                    tempSelectedChips[path.count - 2].append(path)
                }
            } else {
                return nil
            }
        }
        
        // Validation 2.
        if tempSelectedChips[0].count > 1 {
            return nil
        } else {
            // Validation 3.
            if tempSelectedChips[0].count == 1 {
                let topLevelChip = tempSelectedChips[0][0]
                
                var acknowledgedRoutes: Int = 0
                routes.forEachBFS(from: topLevelChip) { path, quest in
                    if withInitialChips.contains(path) {
                        acknowledgedRoutes += 1
                    }
                }
                
                if acknowledgedRoutes != withInitialChips.count {
                    return nil
                }
            }
        }
        
        routes.forEachBFS { absolutePath, chip, _ in
            if absolutePath.count > 1 {
                initialChips[absolutePath.count - 2].append(absolutePath)
            }
        }
        
        self.allChips = initialChips
        self.selectedChips = tempSelectedChips
        
        self.routesLock.wait()
        self.selectedChipsLock.wait()
        self.sortChips(startingAt: 0, buffer: &self.allChips)
        self.sortChips(startingAt: 0, buffer: &self.selectedChips)
        self.selectedChipsLock.signal()
        self.routesLock.signal()
    }
    
    /// Returns the count of active chips at a specified depth.
    ///
    /// - Parameter depth: The depth at which the chips need to be counted.
    ///
    /// - Note: `rootSymbol` has depth 0.
    public func activeChipsAtDepth(_ depth: Int) -> Int {
        self.routesLock.wait()
        
        defer {
            self.routesLock.signal()
        }
        
        if depth > routes.getMaxDepth() {
            #if DEBUG
            Self.logger.debug("\(#function) invoked with depth \(depth) > \(self.routes.getMaxDepth())")
            #endif
            return 0
        } else {
            selectedChipsLock.wait()
            
            defer {
                selectedChipsLock.signal()
            }
            
            return self.selectedChips[depth].count
        }
    }
    
    
    /// If the specified chip is in the selected set, it gets removed. Nothing happens otherwise.
    ///
    /// - Parameter chip: The URL of the chip to unselect.
    /// - Parameter from: The set of chips to remove `chip` from.
    ///
    /// - Note: `chip.count` is preconditioned to be greater than or equal to one.
    /// - Complexity: O(`n*m`) where `n` is the number of distinct path components registered in the subtree rooted in `chip`, and `m` is the number of selected chips at level `chip.count - 2`
    private func unselectChip(
        _ chip: ZTronNavigator.PathComponents,
        from buffer: inout [[ZTronNavigator.PathComponents]]
    ) {
        print(#function)

        var clone = self.cloneSelectedChips()
        
        self.routes.forEachBFS(from: chip) { path, quest in
            clone[path.count - 2].removeAll { chip in
                return chip == path
            }
        }
        
        buffer = clone
    }
    
    /// Adds `chip` to the set of selected chips.
    /// This method performs the following validation on the parameter `chip`:
    ///
    /// 1. The chip URL must have at least two components.
    /// 2. There must be an associated object in the router at the chip's path.
    /// 3. If the chip was already selected, nothing happens.
    ///
    /// If there is at least one level that has two or more chips selected, or the chip is at level 0,
    /// (that is [">", "chip name"]), all the chips at level `chip.count - 2` are unselected.
    /// This guaranteed that in the first strip of chips, only one chip can be active (i.e. selected).
    ///
    /// If the specified chip has neighbours, all the neighbouring chips are also selected.
    ///
    /// Eventually, the chips at level `chip.count - 2` are sorted, in the sense of `QuestModel.leq`
    ///
    /// - Parameter `chip`: The URL of the chip to select.
    /// - Complexity: O(`d*nlog n`) where `d` is the max depth of a chip and `n` is the max number of chips per level
    public func selectChip(_ chip: ZTronNavigator.PathComponents) {
        // chip has at least ">" (rootSymbol) as its path component, therefore set for the current chip is `chip.count - 2`.
        
        precondition(chip.count > 1)
        
        self.routesLock.wait()
        precondition(self.routes.peek(at: chip) != nil)
        self.routesLock.signal()
        
        // Is the requested chip a valid one?
        guard (self.allChips[chip.count - 2].firstIndex (where: { selectedChip in
            return selectedChip == chip
        })) != nil else {
            #if DEBUG
            Self.logger.debug("\(#function) invoked on non-registered path \(chip)")
            #endif
            return
        }
        
        self.selectedChipsLock.wait()
        guard !(self.selectedChips[chip.count - 2].contains(chip)) else {
            #if DEBUG
            Self.logger.debug("\(#function) invoked on already selected chip. Ignored.")
            #endif
            self.selectedChipsLock.signal()
            return
        }

        var clone = cloneSelectedChips()
        selectedChipsLock.signal()
        
        var oneChipPerParent: Bool = true
        
        for i in 0..<chip.count - 2 {
            if clone[i].count != 1 {
                oneChipPerParent = false
                break
            }
        }
        
        if chip.count <= 2 || !oneChipPerParent {
            print("Unselecting chips at level \(chip.count - 2)")
            self.routesLock.wait()
            self.selectedChipsLock.wait()
            clone[chip.count - 2].forEach { chip in
                self.unselectChip(chip, from: &clone)
            }
            self.selectedChipsLock.signal()
            self.routesLock.signal()
        }
        
        clone[chip.count - 2].append(chip)
        
        self.routes.forEachNeighbour(of: chip) { path, quests in
            clone[path.count - 2].append(path)
        }
        
        self.routesLock.wait()
        self.sortChips(startingAt: chip.count - 2, buffer: &clone)
        self.routesLock.signal()
        
        self.selectedChips = clone
    }
    
    
    /// Returns the index of the last visible level of chips. That is, the max depth - 1 of a level with at least one selected chip.
    ///
    /// - Note: As a fault protection, this method tests whether there is an empty level of chips between two any level with at least one chip.
    ///
    /// - Complexity: O(n) where n is the number of selected chips.
    public func lastVisibleLevel() -> Int {
        var firstNilLevelFound: Bool = false
        var lastVisibleLevelIdx: Int = 0
 
        self.selectedChipsLock.wait()
        
        defer {
            self.selectedChipsLock.signal()
        }
        
        for i in 0..<self.selectedChips.count {
            if self.selectedChips[i].count <= 0 {
                firstNilLevelFound = true
            } else {
                lastVisibleLevelIdx = i
            }
            
            if firstNilLevelFound && self.selectedChips[i].count > 0 {
                #if DEBUG
                Self.logger.critical("Found a non-nil level after the first one with no selected chip in \(#function).")
                #endif
                fatalError()
            }
        }
        
        return lastVisibleLevelIdx
    }
    
    
    /// Removes the `chip` from the set of selected chips at level `chip.count - 2`.
    /// If the specified chip is the only active one at level `chip.count - 2`, nothing happens, as per design choice, you can't unselect the only active chip at any level.
    ///
    /// - Note: This implementation preconditions that `chip.count > 1`, and `chip` must be registered in the router.
    /// - Complexity: O(`n*m`) where `n` is the number of distinct path components in the subtree with root in `chip`, and `m` is the number of selected chips at level `chip.count - 2`.
    public func unselectChip(_ chip: ZTronNavigator.PathComponents) {
        
        print(#function)
        precondition(chip.count > 1)
        
        defer {
            self.routesLock.signal()
        }
        
        self.routesLock.wait()
        guard routes.peek(at: chip) != nil else {
            #if DEBUG
            Self.logger.debug("Attempted to unselect unregistered chip \(chip)")
            #endif
            
            return
        }
        
        self.selectedChipsLock.wait()
        
        defer {
            self.selectedChipsLock.signal()
        }
        
        if self.selectedChips[chip.count - 2].count <= 1 {
            #if DEBUG
            Self.logger.debug("Attempted to unselect the only active chip \(chip) at depth \(chip.count-1). Ignored.")
            #endif
            return
        } else {
            var clone = cloneSelectedChips()
            self.unselectChip(chip, from: &clone)
            self.selectedChips = clone
        }
    }
    
    
    /// Performs a shallow copy of the array of selected chips for each level.
    private func cloneSelectedChips() -> [[ZTronNavigator.PathComponents]] {
        var selectedChipsClone = [[ZTronNavigator.PathComponents]].init(repeating: [], count: self.selectedChips.count)
        for i in 0..<self.selectedChips.count {
            selectedChipsClone[i] = Array(selectedChips[i])
        }

        return selectedChipsClone
    }
    
    
    public func getSelectedChips() -> [[ZTronNavigator.PathComponents]] {
        self.selectedChipsLock.wait()
        
        defer {
            self.selectedChipsLock.signal()
        }
        
        return self.cloneSelectedChips()
    }
    
    
    /// Returns the set of all the chip levels with at least one selected chip.
    ///
    /// - Complexity: O(`n^2`) where n is the number of levels of chips.
    public func getChips() -> [[ZTronNavigator.PathComponents]] {
        self.selectedChipsLock.wait()
        
        defer {
            self.selectedChipsLock.signal()
        }
        
        return self.allChips.enumerated().map { offset, chipLevel in
            if offset <= 0 {
                return chipLevel
            } else {
                return chipLevel.compactMap { absolutePath in
                    var shouldInclude = false
                    
                    for i in 2..<absolutePath.count {
                        let pathPrefix = Array(absolutePath.prefix(upTo: i))
                        if self.selectedChips[pathPrefix.count - 2].contains(pathPrefix) {
                            shouldInclude = true
                            break
                        }
                    }
                    
                    return shouldInclude ? absolutePath : nil
                }
            }
        }
    }
    
    
    /// Tests whether of not a specified chip is selected.
    ///
    /// - Parameter `chip`: the URL of the chip to be tested.
    /// - Returns: `true` if the `chip` is selected (at level `chip.count - 2`), `false` otherwise.
    ///
    /// - Complexity: O(n), where `n` is the number of selected chips at level `chip.count - 2`.
    public func isChipSelected(_ chip: ZTronNavigator.PathComponents) -> Bool {
        if chip.count <= 1 {
            #if DEBUG
            Self.logger.debug("\(#function) invoked on \(chip), hash value is \(chip.count - 2)")
            #endif
            return false
        } else {
            self.selectedChipsLock.wait()
            
            defer {
                self.selectedChipsLock.signal()
            }
            
            return self.selectedChips[chip.count - 2].contains(chip)
        }
    }
    
    
    /// Returns the set of all the selected chips at the last level of visible chips.
    ///
    /// - Note: This implementation makes self use of `lastVisibleLevel` to compute the level of chips to return.
    ///
    /// - Complexity: O(n), where `n` is the number of selected chips.
    public func getSelectedChipsAtLastLevel() -> [ZTronNavigator.PathComponents] {
        let lastLevel = self.lastVisibleLevel()
        
        self.selectedChipsLock.wait()
        
        defer {
            self.selectedChipsLock.signal()
        }
        
        return Array(self.selectedChips[lastLevel])
    }
    
    
    /// - Parameter chip: The URL of the chip to get neighbours for.
    /// - Returns: The sorted set of neighbouring chips (that is, elements at depth 1 in the subtree rooted in `chip`), for the specified `chip`.
    /// - Complexity: O(`nlog n`) where `n` is the number of neighbours of the specified chip.
    public func getNeighbouringChips(for chip: ZTronNavigator.PathComponents) -> [ZTronNavigator.PathComponents]? {
        return self.routes.mapNeighbours(for: chip) { absolutePath, quest in
            return absolutePath
        }?.sorted { lhs, rhs in
            self.routesLock.wait()
            
            defer {
                self.routesLock.signal()
            }
            
            return self.leq(lhs, rhs)
        }
    }
    
    /// Defines an order relationship between two chips, according to `getPosition()` of `lhs` and `rhs`, both of type `QuestPositionMapper`.
    private func leq(_ lhs: ZTronNavigator.PathComponents, _ rhs: ZTronNavigator.PathComponents) -> Bool {
        guard let lhsOutput = self.routes.peek(at: lhs), let rhsOutput = self.routes.peek(at: rhs) else {
            return lhs <= rhs
        }
        
        return lhsOutput.getPosition() <= rhsOutput.getPosition()
    }
    
    
    /// Sorts a set of chip levels according to `leq` relationship (their specified positions in `QuestPositionMapper`).
    ///
    /// - Parameter startingAt: The first level of chips to sort.
    /// - Parameter buffer: An array whose elements are arrays of chips.
    ///
    /// - Complexity: O(`(buffer.count - depth)*nlog n`), where `n` is the maximum number of chips at any level.
    private func sortChips(startingAt depth: Int, buffer: inout [[ZTronNavigator.PathComponents]]) {
        if depth < buffer.count {
            for i in depth..<buffer.count {
                buffer[i].sort { lhs, rhs in
                    return self.leq(lhs, rhs)
                }
            }
        }
    }
    
    /// Returns a quest and its associated position for a specified chip.
    ///
    /// - Complexity: O(`chip.count`).
    public func getQuestsMapperFor(chip: ZTronNavigator.PathComponents) -> QuestsPositionMapper? {
        self.routesLock.wait()
        
        defer {
            self.routesLock.signal()
        }
        
        return self.routes.peek(at: chip)
    }
    
    
    /// Returns the sorted set of quests of the parents for the specified `chip`, where the parents are collected from depth 0 to depth `chip.count - 2`, and each parent has an associated quest in the router.
    ///
    /// - Parameter chip: The chip to collect the parents for.
    /// - Complexity: O(`chip.count * nlog n`), where `n`is the number of parents for the specified quest.
    public func getParentQuests(for chip: ZTronNavigator.PathComponents) -> [QuestSetWithParent] {
        var quests: [QuestSetWithParent] = []
        
        for i in 0..<chip.count {
            let parentPath = Array(chip.prefix(upTo: i))
            if let questsForPath = self.routes.peek(at: parentPath) {
                Self.logger.debug("Collecting chips from parent path \(parentPath)")
                quests.append(QuestSetWithParent(quests: questsForPath, parentPath: parentPath))
            }
        }
        
        routesLock.wait()
        
        defer {
            routesLock.signal()
        }
        
        return quests.sorted { lhs, rhs in
            self.leq(lhs.getParentPath(), rhs.getParentPath())
        }
    }
    
    
    /// A structure that represent a parent -> child relationship between two quests.
    public struct QuestSetWithParent: Hashable, Sendable {
        private let quests: QuestsPositionMapper
        private let parentPath: ZTronNavigator.PathComponents
        
        init(quests: QuestsPositionMapper, parentPath: ZTronNavigator.PathComponents) {
            self.quests = quests
            self.parentPath = parentPath
        }
        
        public func getQuestsMapper() -> QuestsPositionMapper {
            return self.quests
        }
        
        public func getParentPath() -> ZTronNavigator.PathComponents {
            return self.parentPath
        }
        
        public static func ==(_ lhs: QuestSetWithParent, _ rhs: QuestSetWithParent) -> Bool {
            return lhs.parentPath == rhs.parentPath && lhs.quests.getQuests() == rhs.quests.getQuests()
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(parentPath)
        }
    }
}

fileprivate extension Array where Element == String {
    static func <=(_ lhs: Self, _ rhs: Self) -> Bool {
        let minCount = Swift.min(lhs.count, rhs.count)
        
        for i in 0..<minCount {
            if lhs[i] < rhs[i] {
                return true
            } else {
                if lhs[i] > rhs[i] {
                    return false
                }
            }
        }
        
        return (lhs.count <= rhs.count) ? true : false
    }
}
