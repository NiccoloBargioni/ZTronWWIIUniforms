import SwiftUI
import AxisTabView
import Combine
import LazyViewSwiftUI
import ZTronRouter
import ZTronSpendingSheet

public struct ChallengeRequirementsTabsSection: View {
    @StateObject private var requirementsModel: ConcreteChallengeRequirementsModel
    @State private var tabContentHeight: [CGFloat] = .init(repeating: .zero, count: 4)
    @State private var selection: Int = 0
    @State private var origin: Int = 0
    @State private var isShowingExtraSection: Bool = false
    
    @StateObject private var history: ZTronNavigator = .init(initialPath: [">"])

    private var quest: Quest
    private var challenge: Challenge<String>
    private var peerChallenges: [Challenge<String>]
    private var frame: CGRect
    
    public init(quest: Quest, challenge: Int, peers: [Challenge<String>], frame: CGRect) {
        self.challenge = peers[challenge]
        self.quest = quest
        self.peerChallenges = peers
        self.frame = frame

        self._requirementsModel = StateObject(
            wrappedValue: ConcreteChallengeRequirementsModel(quest: quest, challenge: peers[challenge])
        )
        
        if let additionalSection = self.mapChallengeToAdditionalSections(peers[challenge].getName()) {
            Self.SECTION_ICONS.append(additionalSection)
        }
    }
    
    public static var SECTION_ICONS: [String] = [
        "checkmark.seal",
        "hand.thumbsdown",
        "ladybug",
        "lightbulb"
    ]
    
    public var body: some View {
        VStack {
            AxisTabView(selection: $selection, constant: ATConstant(axisMode: .top)) { state in
                ATBeadStyle(
                    state,
                    color: Color(UIColor.secondarySystemGroupedBackground),
                    cornerRadius: 0,
                    marbleColor: makeColorFor(tag: selection)
                )
            } content: {
                ForEach(Array(Self.SECTION_ICONS.enumerated()), id: \.element) { index, icon in
                    if index <= 3 {
                        ARequirementTab(
                            cardsInThisSection: self.cardsForTab(withIndex: index),
                            activeTab: self.selection,
                            activeToken: self.requirementsModel.getActiveToken(for: .init(rawValue: self.selection)!),
                            sectionHeight: self.$tabContentHeight[index],
                            colorMapping: self.makeColorFor(tag:)
                        )
                        .includeRequirementsChip(self.includeRequirementChip(for:), self.onRequirementChipTap(from:))
                        .includeDontsChip(self.includeDontsChip(for:), self.onDontsChipTap(from:))
                        .includeBugsChip(self.includeBugsChip(for:), self.onGlitchChipTap(from:))
                        .includeProTipsChip(self.includeProTipsChip(for:), self.onProTipChipTap(from:))
                        .onActiveChipTapped(self.onActiveChipTapped)
                        .tabItem(tag: index, normal: {
                            Image(systemName: icon)
                                .font(.system(size: 16, design: .rounded))
                        }, select: {
                            Image(systemName: icon != "checklist" ? icon + ".fill" : "checklist.checked")
                                .font(.system(size: 16, design: .rounded))
                                .foregroundStyle(makeColorFor(tag: index))
                                .padding(.bottom, 10)
                        })
                    } else {
                        NavigationLink(destination: SpendingHome(quest: self.mapChallengeToQuest(self.challenge.getName())!), isActive: self.$isShowingExtraSection) {
                            Text("Spending sheet")
                        }
                    }
                }
            }
        }
        .frame(width: frame.size.width, height: max(frame.size.height, (self.tabContentHeight[self.selection])))
        .background {
            Color(UIColor.systemGroupedBackground)
        }
        .onValueChange(of: self.selection) { @MainActor in
            if self.selection == 4 {
                self.isShowingExtraSection = true
            } else {
                self.history.navigate([">", self.selection.toString()])
            }
        }
        .onAppear {
            self.history.navigate([">", self.selection.toString()])
            self.isShowingExtraSection = false
            self.selection = 0
        }
    }
    
    @MainActor
    private func makeColorFor(tag: Int) -> Color {
        switch tag {
            case 0:
                return Color(UIColor.systemTeal)
                
            case 1:
                return Color(UIColor.systemOrange)
                
            case 2:
                return Color(UIColor.systemRed)
            
            case 3:
                return Color(UIColor.systemBlue)
                
            default:
                return Color(UIColor.systemGreen)
        }
    }
    
    
    private func cardsForTab(withIndex: Int) -> [Challenge<String>.TaggedString] {
        precondition(withIndex >= 0 && withIndex <= 3)
        
        switch withIndex {
        case 0:
            return self.requirementsModel.getRequirements()
            
        case 1:
            return self.requirementsModel.getDonts()
            
        case 2:
            return self.requirementsModel.getBugs()
            
        case 3:
            return self.requirementsModel.getProTips()
            
        default:
            fatalError("Invalid tab index: \(withIndex). Expected [0,3].")
        }
    }
    
    
    private func includeRequirementChip(for card: Challenge<String>.TaggedString) -> Bool {
        let tag = String(localized: String.LocalizationValue(stringLiteral: card.getTag()), bundle: StringsBundle.bundle)
        return self.selection != 0 && self.requirementsModel.getRequirements(tag).count > 0
    }
    
    private func includeDontsChip(for card: Challenge<String>.TaggedString) -> Bool {
        let tag = String(localized: String.LocalizationValue(stringLiteral: card.getTag()), bundle: StringsBundle.bundle)
        return self.selection != 1 && self.requirementsModel.getDonts(tag).count > 0
    }
    
    private func includeBugsChip(for card: Challenge<String>.TaggedString) -> Bool {
        let tag = String(localized: String.LocalizationValue(stringLiteral: card.getTag()), bundle: StringsBundle.bundle)
        return self.selection != 2 && self.requirementsModel.getBugs(tag).count > 0
    }
    
    private func includeProTipsChip(for card: Challenge<String>.TaggedString) -> Bool {
        let tag = String(localized: String.LocalizationValue(stringLiteral: card.getTag()), bundle: StringsBundle.bundle)
        return self.selection != 3 && self.requirementsModel.getProTips(tag).count > 0
    }
    
    
    
    private func onRequirementChipTap(from card: Challenge<String>.TaggedString) {
        self.selection = 0
        let tag = String(localized: String.LocalizationValue(stringLiteral: card.getTag()), bundle: StringsBundle.bundle)
        
        self.requirementsModel.setToken(for: .init(rawValue: 0)!, tag)
    }
    
    private func onDontsChipTap(from card: Challenge<String>.TaggedString) {
        self.selection = 1
        let tag = String(localized: String.LocalizationValue(stringLiteral: card.getTag()), bundle: StringsBundle.bundle)

        self.requirementsModel.setToken(for: .init(rawValue: 1)!, tag)
    }
    
    private func onGlitchChipTap(from card: Challenge<String>.TaggedString) {
        self.selection = 2
        let tag = String(localized: String.LocalizationValue(stringLiteral: card.getTag()), bundle: StringsBundle.bundle)

        self.requirementsModel.setToken(for: .init(rawValue: 2)!, tag)
    }
    
    private func onProTipChipTap(from card: Challenge<String>.TaggedString) {
        self.selection = 3
        let tag = String(localized: String.LocalizationValue(stringLiteral: card.getTag()), bundle: StringsBundle.bundle)

        self.requirementsModel.setToken(for: .init(rawValue: 3)!, tag)
    }
    
    
    private func onActiveChipTapped() {
        self.requirementsModel.removeTokens(for: .init(rawValue: self.selection)!)
        self.history.goBack()
        
        guard let origin = self.history.path.last?.toInt() else {
            fatalError(self.history.path.description + " is not a valid path: its last component is \(self.history.path.last!.description) was expected to be an integer")
        }
        
        // what if you tap the chip when you're already in the destination tab?
        if self.selection != origin {
            self.selection = origin
            
            // self.selection onChange would cause duplicate origin. Just remove the current one, that will be replaced by the same path for effect of onValueChange(of: self.selection)
            self.history.goBack()
        }
    }
    
    
    private func mapChallengeToAdditionalSections(_ challengeName: String) -> String? {
        switch challengeName {
        case "OUTFIT.SLAYER_FROM_CASABLANCA.BANKER.PENNY_STRANGLER.ChallengeName".fromLocalized():
            return "checklist"
        case "OUTFIT.SLAYER_FROM_CASABLANCA.BANKER.PENNY_PINCHER.ChallengeName".fromLocalized():
            return "checklist"
        default:
            return nil
        }
    }
    
    private func mapChallengeToQuest(_ challengeName: String) -> SpendingQuest? {
        switch challengeName {
        case "OUTFIT.SLAYER_FROM_CASABLANCA.BANKER.PENNY_STRANGLER.ChallengeName".fromLocalized():
            return .pommel
        case "OUTFIT.SLAYER_FROM_CASABLANCA.BANKER.PENNY_PINCHER.ChallengeName".fromLocalized():
            return .easterEgg
        default:
            return nil
        }
    }
}
