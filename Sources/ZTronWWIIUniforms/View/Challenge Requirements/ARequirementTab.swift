import SwiftUI
import LazyViewSwiftUI

internal struct ARequirementTab: View {
    
    private let cardsInThisSection: [Challenge<String>.TaggedString]
    private let activeToken: String?

    private var activeChipTapped: (() -> Void)? = nil
    private let colorMapping: (Int) -> SwiftUI.Color
    
    private let activeTabIndex: Int
    
    // Forwarding
    private var includeRequirementsChip = false
    private var includeDontsChip = false
    private var includeBugsChip = false
    private var includeProTipsChip = false
    
    private var onRequirementsChipTapped: (@Sendable (_:Challenge<String>.TaggedString) -> Void)? = nil
    private var onDontsChipTapped: (@Sendable (_:Challenge<String>.TaggedString) -> Void)? = nil
    private var onBugsChipTapped: (@Sendable (_:Challenge<String>.TaggedString) -> Void)? = nil
    private var onProTipsChipTapped: (@Sendable (_:Challenge<String>.TaggedString) -> Void)? = nil
    
    internal init(
        cardsInThisSection: [Challenge<String>.TaggedString],
        activeTab: Int,
        activeToken: String? = nil,
        colorMapping: @escaping @Sendable (Int) -> SwiftUI.Color
    ) {
        self.cardsInThisSection = Array(cardsInThisSection) // shallow copy is enough, tagged strings are immutable anyway
        self.activeTabIndex = activeTab
        self.activeToken = activeToken
        self.colorMapping = colorMapping
    }
    
    internal var body: some View {
        LazyView(
            VStack(alignment: .leading, spacing: 0) {
                Color.red
                    .frame(maxWidth: .infinity, minHeight: 1, maxHeight: 1)
                    .background {
                        GeometryReader { geoProxy in
                            Color.blue.onAppear {
                                print(geoProxy.frame(in: .global))
                            }.onValueChange(of: geoProxy.frame(in: .global)) {
                                print(geoProxy.frame(in: .global).maxY)
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
                    
                    ForEach(cardsInThisSection, id: \.self) { requirement in
                        RequirementContainer(
                            accentColor: colorMapping(self.activeTabIndex),
                            text: requirement.wrappedValue()
                        ) { tab in
                            return self.colorMapping(tab)
                        }
                        .includeRequirementsChip(includeRequirementsChip) { @Sendable in
                            self.onRequirementsChipTapped?(requirement)
                        }
                        .includeDontsChip(includeDontsChip) { @Sendable in
                            self.onDontsChipTapped?(requirement)
                        }
                        .includeBugsChip(includeBugsChip) { @Sendable in
                            self.onBugsChipTapped?(requirement)
                        }
                        .includeProTipsChip(includeProTipsChip) { @Sendable in
                            self.onProTipsChipTapped?(requirement)
                        }
                    }
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Color.purple
                    .frame(maxWidth: .infinity, minHeight: 1, maxHeight: 1)
                    .background {
                        GeometryReader { geoProxy in
                            Color.indigo.onAppear {
                                print(geoProxy.frame(in: .global))
                            }.onValueChange(of: geoProxy.frame(in: .global)) {
                                print(geoProxy.frame(in: .global).minY)
                            }
                        }
                    }
                }
            )
    }
}


extension ARequirementTab {
    func includeRequirementsChip(_ include: Bool, _ action: (@Sendable (_ requirement: Challenge<String>.TaggedString) -> Void)? = nil ) -> Self {
        var copy = self
        
        copy.includeRequirementsChip = include
        copy.onRequirementsChipTapped = action
        
        return copy
    }
    
    func includeDontsChip(_ include: Bool, _ action: (@Sendable (_: Challenge<String>.TaggedString) -> Void)? = nil ) -> Self {
        var copy = self
        
        copy.includeDontsChip = include
        copy.onDontsChipTapped = action
        
        return copy
    }
    
    func includeBugsChip(_ include: Bool, _ action: (@Sendable (_: Challenge<String>.TaggedString) -> Void)? = nil ) -> Self {
        var copy = self
        
        copy.includeBugsChip = include
        copy.onBugsChipTapped = action
        
        return copy
    }
    
    func includeProTipsChip(_ include: Bool, _ action: (@Sendable (_: Challenge<String>.TaggedString) -> Void)? = nil ) -> Self {
        var copy = self
        
        copy.includeProTipsChip = include
        copy.onProTipsChipTapped = action
        
        return copy
    }
    
    
    func onActiveChipTapped(_ action: (@escaping @Sendable () -> Void)) -> Self {
        var copy = self
        
        copy.activeChipTapped = action
        
        return copy
    }
}
