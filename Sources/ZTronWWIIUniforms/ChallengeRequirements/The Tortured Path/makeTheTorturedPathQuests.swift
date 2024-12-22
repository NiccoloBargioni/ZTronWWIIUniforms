import Foundation

func makeTheTorturedPathQuests() -> [Quest] {
    return [
        Quest(
            map: "the tortured path",
            setName: "OUTFIT.WICHT_WARDEN.COLD_BLOODED.QuestName",
            characterName: "OUTFIT.WICHT_WARDEN.OUTFIT_NAME",
            image: "wicht warden",
            challenges: makeSangueFreddoChallenges()
        )
    ]
}
