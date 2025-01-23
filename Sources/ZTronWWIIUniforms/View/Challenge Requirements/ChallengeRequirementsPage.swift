import SwiftUI
import AxisTabView
import ScalingHeaderScrollView
import ZTronRouter

public struct ChallengeRequirementsPage: View {
    private var quest: Quest
    private var challenge: Challenge<String>
    private var peerChallenges: [Challenge<String>]
    private var challengeOffset: Int
    private var topbarItem: AnyView? = nil
    
    @State private var offset: CGFloat = .zero
    @State private var swipeAngle: CGFloat = .zero
    
    @StateObject private var swipeManager: ChallengeRequirementsSwipeManager

    public init(quest: Quest, challenge: Int, peers: [Challenge<String>], topbarItem: (() -> AnyView?)? = nil) {
        self.challenge = peers[challenge]
        self.quest = quest
        self.peerChallenges = peers
        
        self.challengeOffset = challenge
        self.topbarItem = topbarItem?()
        
        self._swipeManager = StateObject(
            wrappedValue: ChallengeRequirementsSwipeManager(challengesCount: peers.count, initialChallenge: challenge)
        )
    }
    
    public var body: some View {
        GeometryReader { geo in
            ZStack {
                ForEach(Array(self.swipeManager.getChallengesStack()), id: \.id) { challengeBuffer in
                    if challengeBuffer.getPosition() > 0 || self.offset != 0 || self.swipeAngle != 0 {
                        ScalingHeaderScrollView {
                            VStack {
                                Image("Challenge Banner", bundle: .module)
                                    .resizable()
                                    .aspectRatio(1.0, contentMode: .fit)
                                    .frame(width: 75)
                                
                                VStack(spacing: 4) {
                                    Text(self.peerChallenges[challengeBuffer.getWrappedValue()].getName().capitalized)
                                        .foregroundStyle(.primary)
                                        .font(.headline.weight(.medium))
                                        .lineLimit(1)
                                    
                                    Text(self.peerChallenges[challengeBuffer.getWrappedValue()].getRiddle().capitalized)
                                        .font(.subheadline)
                                        .multilineTextAlignment(.center)
                                        .foregroundStyle(.secondary)
                                        .allowsTightening(true)
                                        .minimumScaleFactor(0.5)
                                        .lineLimit(2)
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            }
                            .padding(.horizontal)
                            .padding(.bottom)
                            .overlay(alignment: .trailing) {
                                if self.swipeManager.getCurrentVisibleChallenge() < self.peerChallenges.count - 1 {
                                    Button {
                                        self.performSwipeAnimation(direction: .right, screenWidth: geo.frame(in: .global).width)
                                    } label: {
                                        Image(systemName: "chevron.right")
                                            .font(.system(size: 24))
                                            .foregroundStyle(Color(UIColor.secondaryLabel))
                                    }
                                    .padding(.horizontal)
                                }
                            }
                            .overlay(alignment: .leading) {
                                if self.swipeManager.getCurrentVisibleChallenge() >= 1 {
                                    Button {
                                        self.performSwipeAnimation(direction: .left, screenWidth: geo.frame(in: .global).width)
                                    } label: {
                                        Image(systemName: "chevron.left")
                                            .font(.system(size: 24))
                                            .foregroundStyle(Color(UIColor.secondaryLabel))
                                    }
                                    .padding(.horizontal)
                                }
                            }
                            .background {
                                Color(UIColor.systemBackground)
                            }
                        } content: {
                            ChallengeRequirementsTabsSection(
                                quest: quest,
                                challenge: challengeBuffer.getWrappedValue(),
                                peers: self.peerChallenges,
                                frame: geo.frame(in: .global)
                            )
                            .id(challenge.getName())
                        }
                        .setHeaderSnapMode(.afterFinishAccelerating)
                        .height(min: 0, max: 150)
                        .allowsHeaderCollapse()
                        .headerSnappingPositions(snapPositions: [0, 1])
                        .offset(x: challengeBuffer.getPosition() == 0 ? 0.0 : self.offset, y: 1)
                        .rotationEffect(challengeBuffer.getPosition() <= 0 ? .init(degrees: 0) : .init(degrees: self.swipeAngle))
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image(self.quest.getImage(), bundle: .module)
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fit)
                    .frame(width: 35)
                    .clipShape(Circle())
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                if let topbarItem = self.topbarItem {
                    topbarItem
                }
            }
        }
        .navigationTitle(self.peerChallenges[self.swipeManager.getCurrentVisibleChallenge()].getName().capitalized)
    }
    
    private func performSwipeAnimation(direction: SwipeDirection, screenWidth: CGFloat) {
        let directionMultiplier: CGFloat = direction == .right ? -1 : 1
        
        self.swipeManager.swapBackground(forward: direction == .right)
        self.swipeManager.swapOnscreenBuffer()

        withAnimation(.easeIn(duration: 0.35)) {
            self.offset = directionMultiplier*1.5*screenWidth
            self.swipeAngle = directionMultiplier*12
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            self.swipeManager.prepareForNext(forward: direction == .right)
            self.swipeManager.swapOnscreenBuffer()

            self.offset = 0
            self.swipeAngle = 0
        }
        
    }
    
    private enum SwipeDirection {
        case left
        case right
    }
}
