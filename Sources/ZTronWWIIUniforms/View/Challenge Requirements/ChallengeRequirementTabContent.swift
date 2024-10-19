import SwiftUI
import AxisTabView
import Combine

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
                RequirementTab(for: self.requirementsModel.getRequirements())
                    .tabItem(tag: 0, normal: {
                        Image(systemName: "checkmark.seal")
                            .font(.system(size: 16, design: .rounded))
                    }, select: {
                        Image(systemName: "checkmark.seal.fill")
                            .font(.system(size: 16, design: .rounded))
                            .foregroundStyle(makeColorFor(tag: 0))
                            .padding(.bottom, 10)
                    })
                
                RequirementTab(for: self.requirementsModel.getDonts())
                    .tabItem(tag: 1, normal: {
                        Image(systemName: "hand.thumbsdown")
                            .font(.system(size: 16, design: .rounded))
                        
                    }, select: {
                        Image(systemName: "hand.thumbsdown.fill")
                            .font(.system(size: 16, design: .rounded))
                            .foregroundStyle(makeColorFor(tag: 1))
                            .padding(.bottom, 10)
                    })
                
                RequirementTab(for: self.requirementsModel.getBugs())
                    .tabItem(tag: 2, normal: {
                        Image(systemName: "ladybug")
                            .font(.system(size: 16, design: .rounded))
                        
                    }, select: {
                        Image(systemName: "ladybug.fill")
                            .font(.system(size: 16, design: .rounded))
                            .foregroundStyle(makeColorFor(tag: 2))
                            .padding(.bottom, 10)
                    })
                
                RequirementTab(for: self.requirementsModel.getProTips())
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
    }
    
    
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
    
    @ViewBuilder func RequirementTab(for buffer: [Challenge<String>.TaggedString]) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Color.red
                .frame(maxWidth: .infinity, minHeight: 1, maxHeight: 1)
                .background {
                    GeometryReader { geoProxy in
                        Color.blue.onAppear {
                            print(geoProxy.frame(in: .global))
                        }.onValueChange(of: geoProxy.frame(in: .local)) {
                            print(geoProxy.frame(in: .global).maxY)
                        }
                    }
                }
            
            VStack(alignment: .leading, spacing: 20) {
                
                if let searchToken = self.requirementsModel.getActiveToken(for: .init(rawValue: self.selection)!) {
                    Button {
                        self.requirementsModel.removeTokens(for: .init(rawValue: self.selection)!)
                        self.selection = self.origin
                    } label: {
                        Chip(text: searchToken.capitalized, isActive: true)
                            .softColor(self.makeColorFor(tag: 0).opacity(0.2))
                            .highlightColor(self.makeColorFor(tag: 0))
                            .fontWeight(.heavy)
                            .rightComponent {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.system(size: 14, design: .rounded))
                                    .foregroundStyle(.black)
                                    .erasedToAnyView()
                            }
                    }
                    .tint(Color(UIColor.label))
                }
                
                ForEach(buffer, id: \.self) { requirement in
                    RequirementContainer(
                        accentColor: makeColorFor(tag: self.selection),
                        text: requirement.wrappedValue()
                    ) { tab in
                        return self.makeColorFor(tag: tab)
                    }
                    .includeRequirementsChip(
                        self.selection != 0 &&
                        self.requirementsModel.getRequirements(requirement.getTag()).count > 0
                    ) {
                        self.origin = self.selection
                        self.selection = 0
                        self.requirementsModel.setToken(for: .init(rawValue: 0)!, requirement.getTag())
                    }
                    .includeDontsChip(
                        self.selection != 1 &&
                        self.requirementsModel.getDonts(requirement.getTag()).count > 0
                    ) {
                        self.origin = self.selection
                        self.selection = 1
                        self.requirementsModel.setToken(for: .init(rawValue: 1)!, requirement.getTag())
                    }
                    .includeBugsChip(
                        self.selection != 2 &&
                        self.requirementsModel.getBugs(requirement.getTag()).count > 0
                    ) {
                        self.origin = self.selection
                        self.selection = 2
                        self.requirementsModel.setToken(for: .init(rawValue: 2)!, requirement.getTag())
                    }
                    .includeProTipsChip(
                        self.selection != 3 &&
                        self.requirementsModel.getProTips(requirement.getTag()).count > 0
                    ) {
                        self.origin = self.selection
                        self.selection = 3
                        self.requirementsModel.setToken(for: .init(rawValue: 3)!, requirement.getTag())
                    }
                }
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Color.purple
                .frame(maxWidth: .infinity, minHeight: 1, maxHeight: 1)
                .background {
                    GeometryReader { geoProxy in
                        Color.indigo.onAppear {
                            print(geoProxy.frame(in: .global))
                        }.onValueChange(of: geoProxy.frame(in: .local)) {
                            print(geoProxy.frame(in: .global).minY)
                        }
                    }
                }
            }
        }
}

