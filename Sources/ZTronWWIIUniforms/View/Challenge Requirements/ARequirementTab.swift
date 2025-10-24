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
            GeometryReader { geo in
                ScrollView(.vertical, showsIndicators: false) {
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
                        }
                        
                        List {
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
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            }
                        }
                        .listStyle(.plain)
                        .frame(width: geo.size.width, height: geo.size.height + 200.0)
                    }
                    .frame(width: geo.size.width, height: geo.size.height + 250.0)
                }
            }
        }
        .padding()
        .frame(minWidth: frame.size.width, minHeight: frame.size.height, alignment: .topLeading)
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
    
}
