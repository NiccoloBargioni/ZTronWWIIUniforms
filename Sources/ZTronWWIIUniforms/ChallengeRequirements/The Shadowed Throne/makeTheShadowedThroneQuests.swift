import Foundation

func makeTheShadowedThroneQuests() -> [Quest] {
    return [
        Quest(
            map: "the shadowed throne",
            setName: "ricerca sul campo",
            characterName: "necromedico",
            image: "necromedic",
            challenges: makeRicercaSulCampoChallenges()
        ),
        
        Quest(
            map: "the shadowed throne",
            setName: "giustiziere",
            characterName: "inseguitore",
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
