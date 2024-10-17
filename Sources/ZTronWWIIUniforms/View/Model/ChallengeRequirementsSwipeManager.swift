import Foundation

public final class ChallengeRequirementsSwipeManager: ObservableObject, @unchecked Sendable {
    @Published private var challengesCount: Int
    @Published private var viewStack: [BufferedChallenge]

    private var offscreenBuffer: [BufferedChallenge]
    private var currentIndex: Int


    private let challengesCountLock = DispatchSemaphore(value: 1)
    private let viewStackLock = DispatchSemaphore(value: 1)
    private let offScreenBufferLock = DispatchSemaphore(value: 1)
    private let currentIndexLock = DispatchSemaphore(value: 1)
    
    public init(challengesCount: Int, initialChallenge: Int) {
        precondition(initialChallenge >= 0 && initialChallenge < challengesCount)
        self.challengesCount = challengesCount
        self.currentIndex = initialChallenge
        
        let previousOfFirst = (initialChallenge).circularPrevious(upperBound: challengesCount)
        
        let lb = min(initialChallenge, previousOfFirst)
        let ub = max(initialChallenge, previousOfFirst)


        self.viewStack = [
            BufferedChallenge(wrappedValue: lb, position: previousOfFirst <= initialChallenge ? 0 : 1),
            BufferedChallenge(wrappedValue: ub, position: previousOfFirst <= initialChallenge ? 1 : 0)
        ].reverseIf(previousOfFirst > initialChallenge)
                
        self.offscreenBuffer = [
            BufferedChallenge(wrappedValue: lb, position: previousOfFirst <= initialChallenge ? 0 : 1),
            BufferedChallenge(wrappedValue: ub, position: previousOfFirst <= initialChallenge ? 1 : 0)
        ].reverseIf(previousOfFirst > initialChallenge)
    }
    
    public final func prepareForNext(forward: Bool = true) {
        self.currentIndexLock.wait()
        let nextIndex = forward ?
            currentIndex.circularNext(upperBound: challengesCount) : currentIndex.circularPrevious(upperBound: challengesCount)
        
        let lb = min(nextIndex, currentIndex)
        let ub = max(nextIndex, currentIndex)
                
        let nextOffscreenBuffer = [
            BufferedChallenge(wrappedValue: lb, position: currentIndex <= nextIndex ? 0 : 1),
            BufferedChallenge(wrappedValue: ub, position: currentIndex <= nextIndex ? 1 : 0)
        ].reverseIf(currentIndex > nextIndex)
        
        self.offScreenBufferLock.wait()
        self.offscreenBuffer = nextOffscreenBuffer
        self.offScreenBufferLock.signal()
        
        self.currentIndex = nextIndex
        self.currentIndexLock.signal()

    }
    
    public final func swapBackground(forward: Bool = true) {
        self.challengesCountLock.wait()
        
        defer {
            self.challengesCountLock.signal()
        }
        
        if self.challengesCount > 1 {
            self.challengesCountLock.wait()
            
            let nextIndex = forward ?
                currentIndex.circularNext(upperBound: challengesCount) : currentIndex.circularPrevious(upperBound: challengesCount)
            
            self.currentIndexLock.signal()
            
            self.offScreenBufferLock.wait()
            self.offscreenBuffer[0] = BufferedChallenge(wrappedValue: nextIndex, position: 0)
            self.offScreenBufferLock.signal()
        }
    }
        
    public final func swapOnscreenBuffer() {
        self.viewStackLock.wait()
        self.offScreenBufferLock.wait()
                
        self.viewStack = offscreenBuffer
        
        self.offScreenBufferLock.signal()
        self.viewStackLock.signal()
    }
    
    public func getCurrentVisibleChallenge() -> Int {
        self.currentIndexLock.wait()
        
        defer {
            self.currentIndexLock.signal()
        }
        
        return self.currentIndex
    }
    
    public func getChallengesStack() -> [BufferedChallenge] {
        self.viewStackLock.wait()
        
        defer {
            viewStackLock.signal()
        }
        
        return Array(self.viewStack)
    }
    
    public struct BufferedChallenge: Identifiable, CustomStringConvertible, Sendable {
        public let description: String
        public let id: String
        private let wrappedValue: Int
        private let position: Int
        
        init(wrappedValue: Int, position: Int) {
            self.id = "\(wrappedValue) @ \(position)"
            self.wrappedValue = wrappedValue
            self.position = position
            self.description = "\(wrappedValue) @ \(position)"
        }
        
        public func getWrappedValue() -> Int {
            return self.wrappedValue
        }
        
        public func getPosition() -> Int {
            return self.position
        }
    }
}

fileprivate extension Int {
    func circularPrevious(upperBound: Int) -> Int {
        return (self - 1 + upperBound) % upperBound
    }
    
    func circularNext(upperBound: Int) -> Int {
        return (self + 1) % upperBound
    }
}

fileprivate extension ClosedRange where Bound == Int {
    func circular(upperBound: Int) -> [Int] {
        return Array(self).map { rangeElement in
            return rangeElement % upperBound
        }
    }
}

fileprivate extension Array {
    func reverseIf(_ shouldReverse: Bool) -> Self {
        if shouldReverse {
            return self.reversed()
        } else {
            return self
        }
    }
}
