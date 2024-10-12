import Foundation

func makeTheFinalReichQuests() -> [Quest] {
    return [
        Quest(
            map: "the final reich",
            setName: "OUTFIT.HUNTER.ON_THE_HUNT.QuestName".fromLocalized(),
            characterName: "OUTFIT.HUNTER.OUTFIT_NAME".fromLocalized(),
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
            setName: "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.QuestName".fromLocalized(),
            characterName: "OUTFIT.SURVIVALIST.OUTFIT_NAME".fromLocalized(),
            image: "survivalist",
            challenges: makeGuidaAllaSopravvivenzaChallenges()
        ),
        
        Quest(
            map: "the final reich",
            setName: "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.QuestName".fromLocalized(),
            characterName: "OUTFIT.B.A.T._AGENT.OUTFIT_NAME".fromLocalized(),
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
