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
            challenges: makeGuidaAllasurvivalChallenges()
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
            setName: "OUTFIT.B.A.T._ELITE.OFF_RECORD.QuestName".fromLocalized(),
            characterName: "agente scelto BAT",
            image: "bat elite operative",
            challenges: makeAttivitaSegreteChallenges()
        ),
        
        Quest(
            map: "the final reich",
            setName: "OUTFIT.SLAYER.BIG_GAME.QuestName".fromLocalized(),
            characterName: "OUTFIT.SLAYER.BIG_GAME.OUTFIT_NAME".fromLocalized(),
            image: "slayer",
            challenges: makeCacciaGrossaChallenges()
        ),
        
        Quest(
            map: "the final reich",
            setName: "OUTFIT.WICHT_WARDEN.COLD_BLOODED.QuestName",
            characterName: "OUTFIT.WICHT_WARDEN.OUTFIT_NAME",
            image: "wicht warden",
            challenges: makeSangueFreddoChallenges()
        ),
    ]
}
