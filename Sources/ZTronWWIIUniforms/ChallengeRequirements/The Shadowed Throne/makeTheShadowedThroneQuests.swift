import Foundation

func makeTheShadowedThroneQuests() -> [Quest] {
    return [
        Quest(
            map: "the shadowed throne",
            setName: "OUTFIT.NECROMEDIC.FIELDWORK.QuestName",
            characterName: "OUTFIT.NECROMEDIC.FIELDWORK.OUTFIT_NAME",
            image: "necromedic",
            challenges: makeRicercaSulCampoChallenges()
        ),
        
        Quest(
            map: "the shadowed throne",
            setName: "OUTFIT.STALKER.VIGILANT.QuestName",
            characterName: "OUTFIT.STALKER.VIGILANT.OUTFIT_NAME",
            image: "chaser",
            challenges: makeGiustiziereChallenges()
        ),
        Quest(
            map: "the shadowed throne",
            setName: "OUTFIT.SKULLBREAKER.THE_ANSWER.QuestName",
            characterName: "OUTFIT.SKULLBREAKER.OUTFIT_NAME",
            image: "skullbreaker",
            challenges: makeLaRispostaChallenges()
        ),
    ]
}
