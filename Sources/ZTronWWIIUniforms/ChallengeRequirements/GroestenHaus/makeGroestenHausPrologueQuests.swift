import Foundation

func makeGroestenHausPrologueQuests() -> [Quest] {
    return [
        Quest(
            map: "prologo",
            setName: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.QuestName"),
            characterName: String(localized: "OUTFIT.MOUNTAINEER.OUTFIT_NAME"),
            image: "mountaineer",
            challenges: makeRoughingItChallenges()
        )
    ]
}
