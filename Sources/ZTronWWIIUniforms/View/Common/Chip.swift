import SwiftUI

struct Chip: View {
    private let text: String
    private var isActive: Bool
    
    private var highlight = Color(UIColor(red: 34.0/255.0, green: 139.0/255.0, blue: 230.0/255.0, alpha: 1.0))
    private var soft = Color(UIColor(red: 34.0/255.0, green: 139.0/255.0, blue: 230.0/255.0, alpha: 0.2))
    private var fontWeight: Font.Weight? = nil
    private var rightComponent: (() -> AnyView)? = nil
    
    init(text: String, isActive: Bool) {
        self.text = text
        self.isActive = isActive
    }
    
    var body: some View {
        HStack {
            Text(text)
                .font(.caption)
                .foregroundColor(isActive ? .white : self.highlight)
                .fontWeight(self.fontWeight)
                .id(text)
            
            if let rightComponent = self.rightComponent {
                rightComponent()
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 2)
        .background {
            Capsule()
                .fill(isActive ? self.highlight : self.soft)
        }
        .contentShape(Capsule())
    }
}

#Preview {
    Chip(text: "into the storm", isActive: false)
}

extension Chip {
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
    
    func fontWeight(_ weight: Font.Weight?) -> Self {
        var copy = self
        copy.fontWeight = weight
        return copy
    }
    
    func rightComponent(_ rightComponent: @escaping () -> AnyView) -> Self {
        var copy = self
        copy.rightComponent = rightComponent
        return copy
    }
}

