import Foundation

func makeTheTorturedPathQuests() -> [Quest] {
    return [
        Quest(
            map: "the tortured path",
            setName: "sangue freddo",
            characterName: "sentinella wicht",
            image: "wicht warden",
            challenges: makeSangueFreddoChallenges()
        )
    ]
}
