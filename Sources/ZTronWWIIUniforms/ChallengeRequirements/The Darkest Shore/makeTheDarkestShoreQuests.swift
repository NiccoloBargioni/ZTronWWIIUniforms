import Foundation

func makeTheDarkestShoreQuests() -> [Quest] {
    return [
        Quest(
            map: "the darkest shore",
            setName: "collezionista di antichità",
            characterName: "cacciatore corvosangue",
            image: "hunter",
            challenges: makeCollezionistaDiAntichitaChallenges()
        ),
        
        Quest(
            map: "the darkest shore",
            setName: "vivere il sogno",
            characterName: "cacciatore corvomorte",
            image: "hunter",
            challenges: makeVivereIlSognoChallenges()
        ),
        
        Quest(
            map: "the darkest shore",
            setName: "agente di cambio",
            characterName: "cacciatore di siviglia",
            image: "hunter",
            challenges: makeAgenteDiCambioChallenges()
        ),
        
        Quest(
            map: "the darkest shore",
            setName: "sempre in movimento",
            characterName: "montanaro corvomorte",
            image: "mountaineer",
            challenges: makeSempreInMovimentoChallenges()
        ),
        
        Quest(
            map: "the darkest shore",
            setName: "barbarossa",
            characterName: "montanaro di ruskeala",
            image: "mountaineer",
            challenges: makeBarbarossaChallenges()
        ),
        
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
