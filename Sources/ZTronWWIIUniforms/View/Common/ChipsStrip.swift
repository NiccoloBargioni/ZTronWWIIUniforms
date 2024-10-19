import SwiftUI
import ZTronRouter

struct ChipsStrip<ChipModel>: View where ChipModel: Hashable {
    private let strip: [ChipModel]
    private let action: (ChipModel) -> Void
    private let transformText: (ChipModel) -> String
    private let transformActive: (ChipModel) -> Bool
    
    init(
        strip: [ChipModel],
        transformText: @escaping (ChipModel) -> String,
        transformActive: @escaping (ChipModel) -> Bool,
        action: @escaping (ChipModel) -> Void
    ) {
        self.transformText = transformText
        self.transformActive = transformActive
        self.strip = strip
        self.action = action
    }
    
    var body: some View {
        HStack {
            ForEach(strip, id: \.self) { chip in
                Button {
                    self.action(chip)
                } label: {
                    Chip(
                        text: self.transformText(chip),
                        isActive: self.transformActive(chip)
                    )
                    .id(self.transformText(chip))
                }
            }
        }
        .padding(.horizontal)
    }
}
