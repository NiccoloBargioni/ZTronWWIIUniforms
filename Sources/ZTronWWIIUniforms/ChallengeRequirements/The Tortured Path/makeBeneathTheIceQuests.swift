import Foundation

func makeBeneathTheIceQuests() -> [Quest] {
    return [
        Quest(
            map: "beneath the ice",
            setName: "scavo archeologico",
            characterName: "tigre di ferro",
            image: "iron tiger",
            challenges: makeScavoArcheologicoChallenges()
        )
    ]
}
