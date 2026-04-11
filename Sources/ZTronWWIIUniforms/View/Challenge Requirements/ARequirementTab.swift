import SwiftUI
import Combine

internal struct ARequirementTab: View {
    
    private let cardsInThisSection: [Challenge<String>.TaggedString]
    private let activeToken: String?
    
    private var activeChipTapped: (@MainActor @Sendable () -> Void)? = nil
    private let colorMapping: (Int) -> SwiftUI.Color
    
    private let activeTabIndex: Int
    
    // Forwarding
    private var includeRequirementsChip: (@MainActor @Sendable (_: Challenge<String>.TaggedString) -> Bool)? = nil
    private var includeDontsChip: (@MainActor @Sendable (_: Challenge<String>.TaggedString) -> Bool)? = nil
    private var includeBugsChip: (@MainActor @Sendable (_: Challenge<String>.TaggedString) -> Bool)? = nil
    private var includeProTipsChip: (@MainActor @Sendable (_: Challenge<String>.TaggedString) -> Bool)? = nil
    
    private var onRequirementsChipTapped: (@MainActor @Sendable (_:Challenge<String>.TaggedString) -> Void)? = nil
    private var onDontsChipTapped: (@MainActor @Sendable (_:Challenge<String>.TaggedString) -> Void)? = nil
    private var onBugsChipTapped: (@MainActor @Sendable (_:Challenge<String>.TaggedString) -> Void)? = nil
    private var onProTipsChipTapped: (@MainActor @Sendable (_:Challenge<String>.TaggedString) -> Void)? = nil
    
    private var onHeightChange: (@MainActor @Sendable (CGFloat) -> Void)? = nil
    
    private let frame: CGRect
    
    internal init(
        cardsInThisSection: [Challenge<String>.TaggedString],
        activeTab: Int,
        activeToken: String? = nil,
        frame: CGRect,
        colorMapping: @escaping @MainActor @Sendable (Int) -> SwiftUI.Color
    ) {
        self.cardsInThisSection = Array(cardsInThisSection) // shallow copy is enough, tagged strings are immutable anyway
        self.activeTabIndex = activeTab
        self.activeToken = activeToken
        self.colorMapping = colorMapping
        self.frame = frame
        
        UITableView.appearance().backgroundColor = .none
    }
    
    
    internal var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if let searchToken = self.activeToken {
                Button {
                    self.activeChipTapped?()
                } label: {
                    Chip(text: searchToken.capitalized, isActive: true)
                        .softColor(self.colorMapping(0).opacity(0.2))
                        .highlightColor(self.colorMapping(0).opacity(0.7))
                        .fontWeight(.heavy)
                        .rightComponent {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 14, design: .rounded))
                                .foregroundStyle(.black)
                                .erasedToAnyView()
                        }
                }
                .tint(Color(UIColor.label))
                .padding(.horizontal)
            }
            
            VStack(spacing: 0) {
                ForEach(cardsInThisSection, id: \.self) { card in
                    RequirementCard(
                        accentColor: colorMapping(self.activeTabIndex),
                        text: card.wrappedValue()
                    ) { tab in
                        return self.colorMapping(tab)
                    }
                    .includeRequirementsChip(includeRequirementsChip?(card) ?? false) { @Sendable in
                        Task {
                            await MainActor.run {
                                self.onRequirementsChipTapped?(card)
                            }
                        }
                    }
                    .includeDontsChip(includeDontsChip?(card) ?? false) { @Sendable in
                        Task {
                            await MainActor.run {
                                self.onDontsChipTapped?(card)
                            }
                        }
                    }
                    .includeBugsChip(includeBugsChip?(card) ?? false) { @Sendable in
                        Task {
                            await MainActor.run {
                                self.onBugsChipTapped?(card)
                            }
                        }
                    }
                    .includeProTipsChip(includeProTipsChip?(card) ?? false) { @Sendable in
                        Task {
                            await MainActor.run {
                                self.onProTipsChipTapped?(card)
                            }
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                }
            }
            .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(
            GeometryReader { geometry in
                Color(UIColor.secondarySystemGroupedBackground)
                    .preference(key: HeightPreferenceKey.self, value: geometry.size.height)
                    .onAppear {
                        self.onHeightChange?(geometry.size.height)
                    }
                    .onChange(of: geometry.size.height) { newHeight in
                        self.onHeightChange?(newHeight)
                    }
            }
        )
    }
}


extension ARequirementTab {
    func includeRequirementsChip(
        _ include: (@escaping @MainActor @Sendable (_: Challenge<String>.TaggedString) -> Bool),
        _ action: (@MainActor @Sendable (_: Challenge<String>.TaggedString) -> Void)? = nil
    ) -> Self {
        var copy = self
        
        copy.includeRequirementsChip = include
        copy.onRequirementsChipTapped = action
        
        return copy
    }
    
    func includeDontsChip(
        _ include: (@escaping @MainActor @Sendable (_: Challenge<String>.TaggedString) -> Bool),
        _ action: (@MainActor @Sendable (_: Challenge<String>.TaggedString) -> Void)? = nil
    ) -> Self {
        var copy = self
        
        copy.includeDontsChip = include
        copy.onDontsChipTapped = action
        
        return copy
    }
    
    func includeBugsChip(
        _ include: (@escaping @MainActor @Sendable (_: Challenge<String>.TaggedString) -> Bool),
        _ action: (@MainActor @Sendable (_: Challenge<String>.TaggedString) -> Void)? = nil
    ) -> Self {
        var copy = self
        
        copy.includeBugsChip = include
        copy.onBugsChipTapped = action
        
        return copy
    }
    
    func includeProTipsChip(
        _ include: (@escaping @MainActor @Sendable (_: Challenge<String>.TaggedString) -> Bool),
        _ action: (@MainActor @Sendable (_: Challenge<String>.TaggedString) -> Void)? = nil
    ) -> Self {
        var copy = self
        
        copy.includeProTipsChip = include
        copy.onProTipsChipTapped = action
        
        return copy
    }
    
    
    func onActiveChipTapped(_ action: (@escaping @MainActor @Sendable () -> Void)) -> Self {
        var copy = self
        
        copy.activeChipTapped = action
        
        return copy
    }
    
    // NEW: Height change callback
    func onHeightChange(_ action: @escaping @MainActor @Sendable (CGFloat) -> Void) -> Self {
        var copy = self
        copy.onHeightChange = action
        return copy
    }
}
