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
            setName: "la risposta",
            characterName: "spaccateste",
            image: "skullbreaker",
            challenges: makeLaRispostaChallenges()
        ),
    ]
}
