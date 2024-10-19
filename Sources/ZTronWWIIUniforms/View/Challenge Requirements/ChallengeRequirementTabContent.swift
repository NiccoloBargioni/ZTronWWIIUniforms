import SwiftUI
import AxisTabView
import Combine
import LazyViewSwiftUI

public struct ChallengeRequirementTabContent: View {
    @StateObject private var requirementsModel: ConcreteChallengeRequirementsModel
    @State private var listHeight: [CGFloat] = .init(repeating: .zero, count: 4)
    @State private var selection: Int = 0
    @State private var origin: Int = 0

    private var quest: Quest
    private var challenge: Challenge<String>
    private var peerChallenges: [Challenge<String>]
    private var challengeOffset: Int
    private var frame: CGRect
    
    private var listHeightPublisher = PassthroughSubject<CGFloat, Never>()
    
    public init(quest: Quest, challenge: Int, peers: [Challenge<String>], frame: CGRect) {
        self.challenge = peers[challenge]
        self.quest = quest
        self.peerChallenges = peers
        self.frame = frame
        
        self.challengeOffset = challenge
        
        self._requirementsModel = StateObject(
            wrappedValue: ConcreteChallengeRequirementsModel(quest: quest, challenge: peers[challenge])
        )
    }
    
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
                ARequirementTab(
                    cardsInThisSection: requirementsModel.getRequirements(),
                    activeTab: self.selection,
                    activeToken: self.requirementsModel.getActiveToken(for: .init(rawValue: self.selection)!),
                    sectionHeight: self.$listHeight[0],
                    colorMapping: self.makeColorFor(tag:)
                )
                .includeRequirementsChip(self.includeRequirementChip(for:), self.onRequirementChipTap(from:))
                .includeDontsChip(self.includeDontsChip(for:), self.onDontsChipTap(from:))
                .includeBugsChip(self.includeBugsChip(for:), self.onGlitchChipTap(from:))
                .includeProTipsChip(self.includeProTipsChip(for:), self.onProTipChipTap(from:))
                .onActiveChipTapped(self.onActiveChipTapped)
                .tabItem(tag: 0, normal: {
                    Image(systemName: "checkmark.seal")
                        .font(.system(size: 16, design: .rounded))
                }, select: {
                    Image(systemName: "checkmark.seal.fill")
                        .font(.system(size: 16, design: .rounded))
                        .foregroundStyle(makeColorFor(tag: 0))
                        .padding(.bottom, 10)
                })
                
                ARequirementTab(
                    cardsInThisSection: requirementsModel.getDonts(),
                    activeTab: self.selection,
                    activeToken: self.requirementsModel.getActiveToken(for: .init(rawValue: self.selection)!),
                    colorMapping: self.makeColorFor(tag:)
                )
                .includeRequirementsChip(self.includeRequirementChip(for:), self.onRequirementChipTap(from:))
                .includeDontsChip(self.includeDontsChip(for:), self.onDontsChipTap(from:))
                .includeBugsChip(self.includeBugsChip(for:), self.onGlitchChipTap(from:))
                .includeProTipsChip(self.includeProTipsChip(for:), self.onProTipChipTap(from:))
                .onActiveChipTapped(self.onActiveChipTapped)
                    .tabItem(tag: 1, normal: {
                        Image(systemName: "hand.thumbsdown")
                            .font(.system(size: 16, design: .rounded))
                        
                    }, select: {
                        Image(systemName: "hand.thumbsdown.fill")
                            .font(.system(size: 16, design: .rounded))
                            .foregroundStyle(makeColorFor(tag: 1))
                            .padding(.bottom, 10)
                    })
                
                
                ARequirementTab(
                    cardsInThisSection: requirementsModel.getBugs(),
                    activeTab: self.selection,
                    activeToken: self.requirementsModel.getActiveToken(for: .init(rawValue: self.selection)!),
                    colorMapping: self.makeColorFor(tag:)
                )
                .includeRequirementsChip(self.includeRequirementChip(for:), self.onRequirementChipTap(from:))
                .includeDontsChip(self.includeDontsChip(for:), self.onDontsChipTap(from:))
                .includeBugsChip(self.includeBugsChip(for:), self.onGlitchChipTap(from:))
                .includeProTipsChip(self.includeProTipsChip(for:), self.onProTipChipTap(from:))
                .onActiveChipTapped(self.onActiveChipTapped)
                    .tabItem(tag: 2, normal: {
                        Image(systemName: "ladybug")
                            .font(.system(size: 16, design: .rounded))
                        
                    }, select: {
                        Image(systemName: "ladybug.fill")
                            .font(.system(size: 16, design: .rounded))
                            .foregroundStyle(makeColorFor(tag: 2))
                            .padding(.bottom, 10)
                    })
                
                
                ARequirementTab(
                    cardsInThisSection: requirementsModel.getProTips    (),
                    activeTab: self.selection,
                    activeToken: self.requirementsModel.getActiveToken(for: .init(rawValue: self.selection)!),
                    colorMapping: self.makeColorFor(tag:)
                )
                .includeRequirementsChip(self.includeRequirementChip(for:), self.onRequirementChipTap(from:))
                .includeDontsChip(self.includeDontsChip(for:), self.onDontsChipTap(from:))
                .includeBugsChip(self.includeBugsChip(for:), self.onGlitchChipTap(from:))
                .includeProTipsChip(self.includeProTipsChip(for:), self.onProTipChipTap(from:))
                .onActiveChipTapped(self.onActiveChipTapped)
                    .tabItem(tag: 3, normal: {
                        Image(systemName: "lightbulb")
                            .font(.system(size: 16, design: .rounded))
                        
                    }, select: {
                        Image(systemName: "lightbulb.fill")
                            .font(.system(size: 16, design: .rounded))
                            .foregroundStyle(makeColorFor(tag: 3))
                            .padding(.bottom, 10)
                    })
            }
        }
        .frame(width: frame.size.width, height: max(frame.size.height, self.listHeight[self.selection]*1.05))
        .background {
            Color(UIColor.systemGroupedBackground)
        }
        .onReceive(self.listHeightPublisher.throttle(for: 0.25, scheduler: RunLoop.main, latest: true)) { height in
            self.listHeight[self.selection] = height
        }
        .onValueChange(of: self.listHeight[0]) {
            print("New height \(self.listHeight[0]) just dropped")
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
                return Color(UIColor.systemMint)
        }
    }
    
    
    private func includeRequirementChip(for card: Challenge<String>.TaggedString) -> Bool {
        return self.selection != 0 && self.requirementsModel.getRequirements(card.getTag()).count > 0
    }
    
    private func includeDontsChip(for card: Challenge<String>.TaggedString) -> Bool {
        return self.selection != 1 && self.requirementsModel.getDonts(card.getTag()).count > 0
    }
    
    private func includeBugsChip(for card: Challenge<String>.TaggedString) -> Bool {
        return self.selection != 2 && self.requirementsModel.getBugs(card.getTag()).count > 0
    }
    
    private func includeProTipsChip(for card: Challenge<String>.TaggedString) -> Bool {
        return self.selection != 3 && self.requirementsModel.getProTips(card.getTag()).count > 0
    }
    
    
    
    private func onRequirementChipTap(from card: Challenge<String>.TaggedString) {
        self.origin = self.selection
        self.selection = 0
        self.requirementsModel.setToken(for: .init(rawValue: 0)!, card.getTag())
    }
    
    private func onDontsChipTap(from card: Challenge<String>.TaggedString) {
        self.origin = self.selection
        self.selection = 1
        self.requirementsModel.setToken(for: .init(rawValue: 1)!, card.getTag())
    }
    
    private func onGlitchChipTap(from card: Challenge<String>.TaggedString) {
        self.origin = self.selection
        self.selection = 2
        self.requirementsModel.setToken(for: .init(rawValue: 2)!, card.getTag())
    }
    
    private func onProTipChipTap(from card: Challenge<String>.TaggedString) {
        self.origin = self.selection
        self.selection = 3
        self.requirementsModel.setToken(for: .init(rawValue: 3)!, card.getTag())
    }
    
    
    private func onActiveChipTapped() {
        self.requirementsModel.removeTokens(for: .init(rawValue: self.selection)!)
        self.selection = self.origin
    }
}

