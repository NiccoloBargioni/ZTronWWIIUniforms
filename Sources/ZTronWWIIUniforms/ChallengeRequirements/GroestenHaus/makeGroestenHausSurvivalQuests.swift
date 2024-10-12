internal func makeGroestenHausSurvivalQuests() -> [Quest] {
    return [
        Quest(
            map: "sopravvivenza",
            setName: "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.QuestName".fromLocalized(),
            characterName: "OUTFIT.BLOODRAVEN_MOUNTAINEER.OUTFIT_NAME".fromLocalized(),
            image: "mountaineer",
            challenges: makeRitornoInPatriaChallenges()
        ),
    ]
}
