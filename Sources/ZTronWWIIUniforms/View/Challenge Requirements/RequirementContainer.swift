import SwiftUI

public struct RequirementContainer: View {
    @Environment(\.colorScheme) private var colorScheme
    
    private var accentColor: Color
    private var text: String
    private var colorMapper: (Int) -> Color
    
    private var includeRequirementsChip = false
    private var includeDontsChip = false
    private var includeBugsChip = false
    private var includeProTipsChip = false
    
    private var atLeastOneChip: Bool {
        return self.includeRequirementsChip || self.includeDontsChip || self.includeBugsChip || self.includeProTipsChip
    }
    
    private var onRequirementsChipTapped: (() -> Void)? = nil
    private var onDontsChipTapped: (() -> Void)? = nil
    private var onBugsChipTapped: (() -> Void)? = nil
    private var onProTipsChipTapped: (() -> Void)? = nil

    public init(
        accentColor: Color,
        text: String,
        _ colorMapper: @escaping (Int) -> Color
    ) {
        self.accentColor = accentColor
        self.text = text
        self.colorMapper = colorMapper
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .fill(accentColor)
                .frame(maxWidth: 6)
            
            VStack(alignment: .leading) {
                Text(text)
                    .multilineTextAlignment(.leading)
                    .font(.body)
                
                if atLeastOneChip {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            if self.includeRequirementsChip {
                                Button {
                                    self.onRequirementsChipTapped?()
                                } label: {
                                    Chip(text: "REQUIREMENTS", isActive: false)
                                        .highlightColor(self.colorMapper(0))
                                        .softColor(self.colorMapper(0).opacity(0.2))
                                        .fontWeight(.bold)
                                }
                                .tint(Color(UIColor.label))
                            }
                            
                            if self.includeDontsChip {
                                Button {
                                    self.onDontsChipTapped?()
                                } label: {
                                    Chip(text: "DONT\'S", isActive: false)
                                        .highlightColor(self.colorMapper(1))
                                        .softColor(self.colorMapper(1).opacity(0.2))
                                        .fontWeight(.bold)
                                }
                                .tint(Color(UIColor.label))
                            }
                            
                            if self.includeBugsChip {
                                Button {
                                    self.onBugsChipTapped?()
                                } label: {
                                    Chip(text: "BUGS", isActive: false)
                                        .highlightColor(self.colorMapper(2))
                                        .softColor(self.colorMapper(2).opacity(0.2))
                                        .fontWeight(.bold)
                                }
                                .tint(Color(UIColor.label))
                            }
                            
                            if self.includeProTipsChip {
                                Button {
                                    self.onProTipsChipTapped?()
                                } label: {
                                    Chip(text: "PRO TIPS", isActive: false)
                                        .highlightColor(self.colorMapper(3))
                                        .softColor(self.colorMapper(3).opacity(0.2))
                                        .fontWeight(.bold)
                                }
                                .tint(Color(UIColor.label))
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .fixedSize(horizontal: false, vertical: true)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color(UIColor.label).opacity(0.15), lineWidth: 0.3)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color(UIColor.secondarySystemGroupedBackground))
                }
        }
    }
}

extension RequirementContainer {
    func includeRequirementsChip(_ include: Bool, _ action: (() -> Void)? = nil ) -> Self {
        var copy = self
        
        copy.includeRequirementsChip = include
        copy.onRequirementsChipTapped = action
        
        return copy
    }
    
    func includeDontsChip(_ include: Bool, _ action: (() -> Void)? = nil ) -> Self {
        var copy = self
        
        copy.includeDontsChip = include
        copy.onDontsChipTapped = action
        
        return copy
    }
    
    func includeBugsChip(_ include: Bool, _ action: (() -> Void)? = nil) -> Self {
        var copy = self
        
        copy.includeBugsChip = include
        copy.onBugsChipTapped = action
        
        return copy
    }
    
    func includeProTipsChip(_ include: Bool, _ action: (() -> Void)? = nil ) -> Self {
        var copy = self
        
        copy.includeProTipsChip = include
        copy.onProTipsChipTapped = action
        
        return copy
    }
}
