import Foundation

func makeIntoTheStormQuests() -> [Quest] {
    return [
        Quest(
            map: "into the storm",
            setName: "cacciatore di tempeste",
            characterName: "cavaliere",
            image: "knight",
            challenges: makeCacciatoreDiTempesteChallenges()
        )
    ]
}
