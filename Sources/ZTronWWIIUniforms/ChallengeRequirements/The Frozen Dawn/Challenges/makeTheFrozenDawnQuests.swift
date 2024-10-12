import Foundation

func makeTheFrozenDawnQuests() -> [Quest] {
    return [
        Quest(
            map: "the frozen dawn",
            setName: "cacciatore di ombre",
            characterName: "guardia ombra",
            image: "shadow guard",
            challenges: makeCacciatoreDiOmbreChallenges()
        ),
        
        Quest(
            map: "the frozen dawn",
            setName: "esploratore ribelle",
            characterName: "viandante",
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
