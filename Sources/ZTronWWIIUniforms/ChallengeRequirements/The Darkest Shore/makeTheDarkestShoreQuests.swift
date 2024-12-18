import Foundation

func makeTheDarkestShoreQuests() -> [Quest] {
    return [
        Quest(
            map: "the darkest shore",
            setName: "OUTFIT.BLOODRAVEN_HUNTER.ANTIQUE_COLLECTOR.QuestName".fromLocalized(),
            characterName: "OUTFIT.BLOODRAVEN_HUNTER.OUTFIT_NAME".fromLocalized(),
            image: "hunter",
            challenges: makeCollezionistaDiAntichitaChallenges()
        ),
        
        Quest(
            map: "the darkest shore",
            setName: "OUTFIT.DEATHRAVEN_HUNTER.LIVING_THE_DREAM.QuestName",
            characterName: "OUTFIT.DEATHRAVEN_HUNTER.OUTFIT_NAME",
            image: "hunter",
            challenges: makeVivereIlSognoChallenges()
        ),
        
        Quest(
            map: "the darkest shore",
            setName: "OUTFIT.THE_HUNTER_FROM_SEVILLE.STOCK_BROKER.QuestName",
            characterName: "OUTFIT.THE_HUNTER_FROM_SEVILLE.OUTFIT_NAME",
            image: "hunter",
            challenges: makeAgenteDiCambioChallenges()
        ),
        
        Quest(
            map: "the darkest shore",
            setName: "OUTFIT.DEATHRAVEN_MOUNTAINEER.KEEP_MOVING.QuestName",
            characterName: "OUTFIT.DEATHRAVEN_MOUNTAINEER.OUTFIT_NAME",
            image: "mountaineer",
            challenges: makeSempreInMovimentoChallenges()
        ),
        
        Quest(
            map: "the darkest shore",
            setName: "OUTFIT.THE_MOUNTAINEER_FROM_RUSKEALA.BARBAROSSA.QuestName",
            characterName: "OUTFIT.THE_MOUNTAINEER_FROM_RUSKEALA.OUTFIT_NAME",
            image: "mountaineer",
            challenges: makeBarbarossaChallenges()
        ),
        
        // MARK: - RESTART FROM HERE
        Quest(
            map: "the darkest shore",
            setName: "al comando",
            characterName: "survivalista corvosangue",
            image: "survivalist",
            challenges: makeAlComandoChallenges()
        ),
        
        Quest(
            map: "the darkest shore",
            setName: "vero asso",
            characterName: "survivalista corvomorte",
            image: "survivalist",
            challenges: makeVeroAssoChallenges()
        ),
        
        Quest(
            map: "the darkest shore",
            setName: "il cacciatore",
            characterName: "la survivalista di hanoi",
            image: "survivalist",
            challenges: makeIlCacciatoreChallenges()
        ),
        
        Quest(
            map: "the darkest shore",
            setName: "V.I.B",
            characterName: "massacratore corvosangue",
            image: "slayer",
            challenges: makeVIBChallenges()
        ),
        
        Quest(
            map: "the darkest shore",
            setName: "ferri del mestiere",
            characterName: "massacratore corvomorte",
            image: "slayer",
            challenges: makeFerriDelMestiereChallenges()
        ),
        
        Quest(
            map: "the darkest shore",
            setName: "banchiere",
            characterName: "il massacratore di casablanca",
            image: "slayer",
            challenges: makeBanchiereChallenges()
        )
    ]
}
