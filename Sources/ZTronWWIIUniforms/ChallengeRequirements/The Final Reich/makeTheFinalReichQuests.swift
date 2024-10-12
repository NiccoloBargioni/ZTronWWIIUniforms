import Foundation

func makeTheFinalReichQuests() -> [Quest] {
    return [
        Quest(
            map: "the final reich",
            setName: "a caccia",
            characterName: "cacciatore",
            image: "hunter",
            challenges: makeOnTheHuntChallenges()
        ),
        
        Quest(
            map: "the final reich",
            setName: "OUTFIT.MOUNTAINEER.ROUGHING_IT.QuestName".fromLocalized(),
            characterName: "OUTFIT.MOUNTAINEER.OUTFIT_NAME".fromLocalized(),
            image: "mountaineer",
            challenges: makeRoughingItChallenges()
        ),
        
        Quest(
            map: "the final reich",
            setName: "guida alla sopravvivenza",
            characterName: "survivalista",
            image: "survivalist",
            challenges: makeGuidaAllaSopravvivenzaChallenges()
        ),
        
        Quest(
            map: "the final reich",
            setName: "in missione",
            characterName: "agente BAT",
            image: "bat agent",
            challenges: makeInMissioneChallenges()
        ),
        
        Quest(
            map: "the final reich",
            setName: "attività segrete",
            characterName: "agente scelto BAT",
            image: "bat elite operative",
            challenges: makeAttivitaSegreteChallenges()
        ),
        
        Quest(
            map: "the final reich",
            setName: "caccia grossa",
            characterName: "uccisore",
            image: "slayer",
            challenges: makeCacciaGrossaChallenges()
        )
    ]
}
