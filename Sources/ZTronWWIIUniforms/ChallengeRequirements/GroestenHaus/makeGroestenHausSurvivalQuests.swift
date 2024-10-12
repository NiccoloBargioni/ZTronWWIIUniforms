internal func makeGroestenHausSurvivalQuests() -> [Quest] {
    return [
        Quest(
            map: "sopravvivenza",
            setName: "ritorno in patria",
            characterName: "montanaro corvosangue",
            image: "mountaineer",
            challenges: makeRitornoInPatriaChallenges()
        ),
    ]
}
