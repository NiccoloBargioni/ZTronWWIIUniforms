import Foundation

func makeBeneathTheIceQuests() -> [Quest] {
    return [
        Quest(
            map: "beneath the ice",
            setName: "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.QuestName",
            characterName: "OUTFIT.IRON_RIGER.OUTFIT_NAME",
            image: "iron tiger",
            challenges: makeScavoArcheologicoChallenges()
        )
    ]
}
