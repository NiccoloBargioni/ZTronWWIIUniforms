import SwiftUI
import LazyViewSwiftUI

internal struct ARequirementTab: View {
    
    private let cardsInThisSection: [Challenge<String>.TaggedString]
    private let activeToken: String?

    private var activeChipTapped: (@MainActor @Sendable () -> Void)? = nil
    private let colorMapping: (Int) -> SwiftUI.Color
    
    private let activeTabIndex: Int
    
    @State private var minY: CGFloat = .zero
    @State private var maxY: CGFloat = .zero
    
    @Binding private var sectionHeight: CGFloat
    
    // Forwarding
    private var includeRequirementsChip: (@MainActor @Sendable (_: Challenge<String>.TaggedString) -> Bool)? = nil
    private var includeDontsChip: (@MainActor @Sendable (_: Challenge<String>.TaggedString) -> Bool)? = nil
    private var includeBugsChip: (@MainActor @Sendable (_: Challenge<String>.TaggedString) -> Bool)? = nil
    private var includeProTipsChip: (@MainActor @Sendable (_: Challenge<String>.TaggedString) -> Bool)? = nil
    
    private var onRequirementsChipTapped: (@MainActor @Sendable (_:Challenge<String>.TaggedString) -> Void)? = nil
    private var onDontsChipTapped: (@MainActor @Sendable (_:Challenge<String>.TaggedString) -> Void)? = nil
    private var onBugsChipTapped: (@MainActor @Sendable (_:Challenge<String>.TaggedString) -> Void)? = nil
    private var onProTipsChipTapped: (@MainActor @Sendable (_:Challenge<String>.TaggedString) -> Void)? = nil
    
    
    
    internal init(
        cardsInThisSection: [Challenge<String>.TaggedString],
        activeTab: Int,
        activeToken: String? = nil,
        sectionHeight: Binding<CGFloat> = .constant(.zero),
        colorMapping: @escaping @MainActor @Sendable (Int) -> SwiftUI.Color
    ) {
        self.cardsInThisSection = Array(cardsInThisSection) // shallow copy is enough, tagged strings are immutable anyway
        self.activeTabIndex = activeTab
        self.activeToken = activeToken
        self._sectionHeight = sectionHeight
        self.colorMapping = colorMapping
    }
    
    
    internal var body: some View {
        LazyView(
            VStack(alignment: .leading, spacing: 0) {
                Color.clear
                    .frame(maxWidth: .infinity, minHeight: 1, maxHeight: 1)
                    .background {
                        GeometryReader { geoProxy in
                            Color.clear.onAppear {
                                Task {
                                    await MainActor.run {
                                        self.minY = geoProxy.frame(in: .global).maxY
                                    }
                                }
                            }.onValueChange(of: geoProxy.frame(in: .global)) {
                                Task {
                                    await MainActor.run {
                                        self.minY = geoProxy.frame(in: .global).maxY
                                    }
                                }
                            }
                        }
                    }
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    if let searchToken = self.activeToken {
                        Button {
                            self.activeChipTapped?()
                        } label: {
                            Chip(text: searchToken.capitalized, isActive: true)
                                .softColor(self.colorMapping(0).opacity(0.2))
                                .highlightColor(self.colorMapping(0))
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
                    }
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Color.clear
                    .frame(maxWidth: .infinity, minHeight: 1, maxHeight: 1)
                    .background {
                        GeometryReader { geoProxy in
                            Color.clear.onAppear {
                                Task {
                                    await MainActor.run {
                                        self.maxY = geoProxy.frame(in: .global).minY
                                    }
                                }
                            }.onValueChange(of: geoProxy.frame(in: .global)) {
                                Task {
                                    await MainActor.run {
                                        self.maxY = geoProxy.frame(in: .global).minY
                                    }
                                }
                            }
                        }
                    }
                }
            )
        .onValueChange(of: self.minY) {
            Task {
                await MainActor.run {
                    if self.maxY > self.minY && abs((self.maxY - self.minY) - self.sectionHeight) > sqrt(1.ulp) {
                        self.sectionHeight = self.maxY - self.minY
                    }
                }
            }
        }
        .onValueChange(of: self.maxY) {
            Task {
                await MainActor.run {
                    if self.maxY > self.minY && abs((self.maxY - self.minY) - self.sectionHeight) > sqrt(1.ulp) {
                        self.sectionHeight = self.maxY - self.minY
                    }
                }
            }
        }
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
