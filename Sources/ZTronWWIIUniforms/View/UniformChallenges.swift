import SwiftUI
import ScalingHeaderScrollView
import SwiftUIIntrospect

public struct UniformsChallenges: View {
    @Environment(\.colorScheme) private var colorScheme
    @StateObject private var quest: Quest
    
    @State private var listContentHeight: CGFloat = .zero
    
    private var fromMap: String
    
    private var glowColor: Color {
        if colorScheme == .light {
            return Color.blue
        } else {
            return Color.cyan
        }
    }
    
    public init(_ quest: Quest, fromMap: String) {
        self._quest = StateObject(wrappedValue: quest)
        self.fromMap = fromMap
    }
    
    public var body: some View {
        GeometryReader { geo in
            ScalingHeaderScrollView {
                ZStack {
                    VStack {
                        Image(self.quest.getImage(), bundle: .module)
                            .resizable()
                            .aspectRatio(1.0, contentMode: .fit)
                            .clipShape(Circle())
                            .frame(width: 100)
                        
                        VStack(spacing: 0) {
                            Text(self.quest.getCharacterName().capitalized)
                                .foregroundStyle(.primary)
                                .font(.headline.weight(.medium))
                                .lineLimit(1)
                            
                            Text(self.quest.getSetName().capitalized)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                                .allowsTightening(true)
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                .padding(.bottom)
                .background {
                    Rectangle()
                        .shadow(color: Color(UIColor.label).opacity(0.15),
                                radius: 1, x: 0, y: 1)
                        .overlay {
                            Rectangle()
                                .fill(Color(UIColor.systemBackground))
                                .overlay(alignment: .topLeading) {
                                    Rectangle()
                                        .fill(Color(UIColor.systemBackground))
                                        .frame(height: 1.0)
                                }
                        }
                }
                .ignoresSafeArea(.all, edges: .horizontal)

            } content: {
                List {
                    Section {
                        ForEach(Array(self.quest.getChallenges().enumerated()), id: \.element) { offset, challenge in
                            NavigationLink(destination: ChallengeRequirementsPage(
                                quest: self.quest,
                                challenge: offset,
                                peers: self.quest.getChallenges()
                                )
                            ) {
                                HStack {
                                    ZStack {
                                        Image("Challenge Banner", bundle: .module)
                                            .resizable()
                                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        
                                        if challenge.getMap() == self.fromMap {
                                            ChallengeBannerOutlineShape()
                                                .stroke(self.glowColor, lineWidth: colorScheme == .light ? 1 : 1)
                                                .blendMode(.multiply)
                                                .shadow(color: self.glowColor, radius: colorScheme == .light ? 2 : 2)
                                                .shadow(color: self.glowColor, radius: 2)
                                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        }
                                    }
                                    .frame(width: 50, height: 50)
                                    
                                    VStack(alignment: .leading) {
                                        Text(challenge.getName())
                                            .font(.headline)
                                            .foregroundStyle(.primary)
                                            .lineLimit(1)
                                        
                                        Text(challenge.getRiddle())
                                            .font(.subheadline)
                                            .foregroundStyle(.secondary)
                                            .lineLimit(2)
                                    }
                                    .frame(maxHeight: .infinity, alignment: .center)
                                }
                            }
                            .tint(Color(UIColor.label))
                        }
                    }
                }
                .introspect(.list, on: .iOS(.v15)) { updateCoalescingTableView in
                    DispatchQueue.main.async {
                        updateCoalescingTableView.layoutIfNeeded()
                        
                        self.listContentHeight = updateCoalescingTableView.contentSize.height
                    }
                }
                .introspect(.list, on: .iOS(.v16, .v17, .v18)) { updateCoalescingTableView in
                    DispatchQueue.main.async {
                        updateCoalescingTableView.layoutIfNeeded()
                        
                        self.listContentHeight = updateCoalescingTableView.contentSize.height
                    }
                }
                .frame(
                    width: geo.size.width,
                    height: self.listContentHeight > 0 ?
                        max(
                            geo.size.height,
                            self.listContentHeight * 1.1
                        )
                            :
                        geo.size.height
                )
            }
            .setHeaderSnapMode(.afterFinishAccelerating)
            .height(min: 0, max: 150)
            .allowsHeaderCollapse()
            .headerSnappingPositions(snapPositions: [0, 1])
            .offset(y: 1)
        }
        .navigationTitle(self.quest.getCharacterName().capitalized)
    }
}
