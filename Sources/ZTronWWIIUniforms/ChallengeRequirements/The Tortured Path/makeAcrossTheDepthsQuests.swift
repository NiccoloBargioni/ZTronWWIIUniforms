import Foundation

func makeAcrossTheDepthsQuests() -> [Quest] {
    return [
        Quest(
            map: "across the depths",
            setName: "capitano di vascello",
            characterName: "la morte",
            image: "death",
            challenges: makeCapitanoDiVascelloChallenges()
        ),
    ]
}
