import Foundation

func makeTheFrozenDawnQuests() -> [Quest] {
    return [
        Quest(
            map: "the frozen dawn",
            setName: "OUTFIT.SHADOWGUARD.SHADOW_HUNTER.QUEST_NAME",
            characterName: "OUTFIT.SHADOWGUARD.OUTFIT_NAME",
            image: "shadow guard",
            challenges: makeCacciatoreDiOmbreChallenges()
        ),
        
        Quest(
            map: "the frozen dawn",
            setName: "OUTFIT.WAYFARER.WAYWARD_RIDER.QuestName",
            characterName: "OUTFIT.WAYFARER.OUTFIT_NAME",
            image: "wanderer",
            challenges: makeEsploratoreRibelleChallenges()
        ),
        Quest(
            map: "the frozen dawn",
            setName: "assassino desertico",
            characterName: "messaggero della morte",
            image: "death messenger",
            challenges: makeAssassinoDeserticoChallenges()
        ),
        
        Quest(
            map: "the frozen dawn",
            setName: "sangue freddo",
            characterName: "sentinella wicht",
            image: "wicht warden",
            challenges: makeSangueFreddoChallenges()
        ),
    ]
}
