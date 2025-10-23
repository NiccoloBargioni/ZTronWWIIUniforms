import SwiftUI
import ZTronRouter
import ZTronTheme

struct ChipsStrip<ChipModel>: View where ChipModel: Hashable {
    private let strip: [ChipModel]
    private let action: (ChipModel) -> Void
    private let transformText: (ChipModel) -> String
    private let transformActive: (ChipModel) -> Bool
    
    private var highlight: Color
    private var soft: Color

    init(
        strip: [ChipModel],
        transformText: @escaping (ChipModel) -> String,
        transformActive: @escaping (ChipModel) -> Bool,
        action: @escaping (ChipModel) -> Void,
        theme: any ZTronTheme = ZTronThemeProvider.default()
    ) {
        self.transformText = transformText
        self.transformActive = transformActive
        self.strip = strip
        self.action = action
        self.highlight = Color(theme.erasedToAnyTheme().colorSet, value: \.brand)
        self.soft = Color(theme.erasedToAnyTheme().colorSet, value: \.visitedMaterial)
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
                    .highlightColor(self.highlight)
                    .softColor(self.soft)
                    .id(self.transformText(chip))
                }
            }
        }
        .padding(.horizontal)
    }
    
    func highlightColor(_ color: Color) -> Self {
        var copy = self
        copy.highlight = color
        return copy
    }
    
    func softColor(_ color: Color) -> Self {
        var copy = self
        copy.soft = color
        return copy
    }

}
