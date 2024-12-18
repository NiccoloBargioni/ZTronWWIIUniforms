import SwiftUI

public struct UniformsHome: View {

    @Environment(\.horizontalSizeClass) private var hSizeClass

    @State private var selectedView = 0
    private let maps = [
        "groesten haus",
        "the final reich",
        "the darkest shore",
        "the shadowed throne",
        "the tortured path",
        "the frozen dawn"
    ]

    public init() {  }

    public var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                HStack {
                    Button {

                    } label: {
                        Image(systemName: "square.grid.3x3")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .frame(height: 44)
                            .frame(maxWidth: .infinity)
                    }
                    .frame(maxWidth: .infinity)
                    .tint(self.selectedView == 0 ? Color("SelectedTab") : Color("SelectedTab"))

                    Button {

                    } label: {
                        Image(systemName: "list.bullet")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .frame(height: 44)
                            .frame(maxWidth: .infinity)
                    }
                    .frame(maxWidth: .infinity)
                    .tint(self.selectedView == 1 ? Color("SelectedTab") : Color(UIColor.label))
                }
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

                let cellSize: CGFloat = (hSizeClass == .regular) ?
                        geo.size.width/3.0 - 2.0
                            :
                        geo.size.width/4.0 - 2.0

                let columns = [GridItem].init(
                    repeating: GridItem(.fixed(cellSize), spacing: 1),
                    count: hSizeClass == .regular ? 3 : 4
                )

                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 1) {
                        ForEach(self.maps, id: \.self) { map in
                            Button {
                                
                            } label: {
                                NavigationLink(destination: UniformQuests(map: map)) {
                                    Image(map, bundle: .module)
                                        .resizable()
                                        .frame(width: cellSize)
                                        .aspectRatio(1.0, contentMode: .fit)
                                        .padding(.leading, 1.0)
                                }
                            }
                        }
                    }
                }

                Spacer()
                
            }
        }
        .tint(Color(UIColor.label).opacity(0.8))
        .offset(y: 1.0)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("Uniforms")
    }

}

#Preview {
    UniformsHome()
}
