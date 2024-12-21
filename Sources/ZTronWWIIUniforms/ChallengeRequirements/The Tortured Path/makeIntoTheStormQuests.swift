import Foundation

func makeIntoTheStormQuests() -> [Quest] {
    return [
        Quest(
            map: "into the storm",
            setName: "OUTFIT.CAVALIER.STORM_CHASER.QuestName",
            characterName: "OUTFIT.CAVALIER.OUTFIT_NAME",
            image: "knight",
            challenges: makeCacciatoreDiTempesteChallenges()
        )
    ]
}
