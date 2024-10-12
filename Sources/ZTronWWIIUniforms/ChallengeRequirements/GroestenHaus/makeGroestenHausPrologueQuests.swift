import Foundation

func makeGroestenHausPrologueQuests() -> [Quest] {
    return [
        Quest(
            map: "prologo",
            setName: "OUTFIT.MOUNTAINEER.ROUGHING_IT.QuestName".fromLocalized(),
            characterName:  "OUTFIT.MOUNTAINEER.OUTFIT_NAME".fromLocalized(),
            image: "mountaineer",
            challenges: makeRoughingItChallenges()
        )
    ]
}
