import SwiftUI

public struct UniformQuests: View {
    @StateObject private var questsModel: QuestModel
    
    public init?(map: String) {
        guard let model = QuestModel(
            routes: makeAllChallengesByMap(),
            withInitialChips: [
                [">", map]
            ]
        ) else {
            return nil
        }
        
        self._questsModel = StateObject(wrappedValue: model)
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            // MARK: - THE TOP STRIPS
            ForEach(
                Array(
                    self.questsModel
                        .getChips()
                        .prefix(upTo: self.questsModel.lastVisibleLevel() + 1))
                        .appending(
                            contentsOf:
                                self.questsModel.getSelectedChipsAtLastLevel().count > 1 ?
                                nil
                                    :
                                self.questsModel.getSelectedChipsAtLastLevel().first != nil ?
                                [
                                    self.questsModel.getNeighbouringChips(
                                        for: self.questsModel.getSelectedChipsAtLastLevel().first!
                                    )!
                                ]
                                    :
                                nil
                        ),
                id: \.self
            ) { chipLevel in
                if chipLevel.count > 0 { // Necessary to avoid flicks in vertical padding when going from multiple chips selected to one
                    ScrollViewReader { scrollViewReader in
                        ScrollView(.horizontal, showsIndicators: false) {
                            ChipsStrip(strip: chipLevel) { chip in
                                return chip.last!.capitalized
                            } transformActive: { chip in
                                return self.questsModel.isChipSelected(chip)
                            } action: { chip in
                                withAnimation {
                                    if self.questsModel.isChipSelected(chip) {
                                        self.questsModel.unselectChip(chip)
                                    } else {
                                        self.questsModel.selectChip(chip)
                                    }
                                    scrollViewReader.scrollTo(chip.last!.capitalized, anchor: .center)
                                }
                            }
                        }
                        .onAppear {
                            DispatchQueue.main.async {
                                if chipLevel.first!.count <= 2 {
                                    let selectedChipsForThisLevel = self.questsModel.getSelectedChips()[chipLevel.first!.count - 2]
                                    if selectedChipsForThisLevel.count > 0 {
                                        scrollViewReader.scrollTo(selectedChipsForThisLevel.first!.last!.capitalized, anchor: .center)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.vertical, 6.5)
                }
            }
            
            Divider()
                .shadow(radius: 1, x: 0, y: 1)
            
            
            let lastLevelOfChips = self.questsModel.getSelectedChipsAtLastLevel()
            
            if lastLevelOfChips.count > 0 {
                List {
                    // MARK: - COLLECTED CHIPS FROM PARENTS
                    let parentsQuestsSets = self.questsModel.getParentQuests(for: lastLevelOfChips.first!)
                    
                    ForEach(parentsQuestsSets, id:\.self) { questsSet in
                        if questsSet.getQuestsMapper().getQuests().count > 0 {
                            Section(questsSet.getParentPath().last!) {
                                ForEach(questsSet.getQuestsMapper().getQuests(), id: \.self) { quest in
                                    NavigationLink(destination: UniformsChallenges(
                                        quest,
                                        fromMap: questsSet.getParentPath().last!
                                    )) {
                                        ChallengesListItem(
                                            image: quest.getImage(),
                                            charcterName: quest.getCharacterName(),
                                            setName: quest.getSetName()
                                        )
                                    }
                                    .tint(Color(UIColor.label))
                                }
                            }
                        }
                    }
                    
                    // MARK: - QUESTS LAST LEVEL OF CHIPS
                    ForEach(lastLevelOfChips, id:\.self) { chip in
                        if let chipQuests = self.questsModel.getQuestsMapperFor(chip: chip) {
                            Section(chip.last!.capitalized) {
                                ForEach(chipQuests.getQuests(), id: \.id) { quest in
                                    NavigationLink(destination: UniformsChallenges(quest, fromMap: chip.last!)) {
                                        ChallengesListItem(
                                            image: quest.getImage(),
                                            charcterName: quest.getCharacterName(),
                                            setName: quest.getSetName()
                                        )
                                    }
                                    .tint(Color(UIColor.label))
                                }
                            }
                        }
                    }
                }
                .contentShape(Rectangle())
            } else {
                GeometryReader { geoProxy in
                    VStack {
                        Image("Challenge Banner", bundle: .module)
                            .resizable()
                            .aspectRatio(1.0, contentMode: .fit)
                            .frame(width: geoProxy.size.width * 0.15)
                            .grayscale(1.0)
                        
                        Text("Select a map")
                            .foregroundColor(Color(UIColor.label).opacity(0.6))
                            .font(.headline)
                            .foregroundStyle(.primary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                }
                .background {
                    Color(UIColor.label).opacity(0.2)
                }
                .ignoresSafeArea(.all, edges: .all)
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(self.questsModel.getSelectedChips().first?.first?.last?.capitalized ?? "Outfits")
        
    }
    
}

#Preview {
    UniformQuests(map: "the frozen dawn")
}


fileprivate extension Array {
    func appending(contentsOf: [Element]?) -> [Element] {
        guard let contentsOf = contentsOf else { return self }
        
        var copy = Array(self)
        copy.append(contentsOf: contentsOf)
        
        return copy
    }
}
