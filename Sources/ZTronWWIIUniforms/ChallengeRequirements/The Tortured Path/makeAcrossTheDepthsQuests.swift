import Foundation

func makeAcrossTheDepthsQuests() -> [Quest] {
    return [
        Quest(
            map: "across the depths",
            setName: "OUTFIT.LADY_DEATH.CREW_CAPTAIN.QuestName",
            characterName: "OUTFIT.LADY_DEATH.OUTFIT_NAME",
            image: "death",
            challenges: makeCapitanoDiVascelloChallenges()
        ),
    ]
}
