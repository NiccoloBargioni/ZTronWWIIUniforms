import Foundation

internal class Quest: ObservableObject, Identifiable, Hashable, Equatable {
    private let characterName: String
    private let setName: String
    private let map: String
    private let image: String
    private let challenges: [Challenge<String>]
    internal let id: String

    internal init(
        map: String,
        setName: String,
        characterName: String,
        image: String,
        challenges: [Challenge<String>]
    ) {
        self.characterName = characterName
        self.setName = setName
        self.map = map
        self.image = image
        self.id = characterName
        self.challenges = challenges
    }

    internal static func == (lhs: Quest, rhs: Quest) -> Bool {
        return lhs.id == rhs.id
    }

    internal func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    internal func getCharacterName() -> String {
        return self.characterName
    }

    internal func getSetName() -> String {
        return self.setName
    }

    internal func getMap() -> String {
        return self.map
    }

    internal func getImage() -> String {
        return self.image
    }

    internal func getChallenges() -> [Challenge<String>] {
        return self.challenges
    }
}

internal class QuestsPositionMapper {
    private let quests: [Quest]
    private let position: Int
    
    internal init(quests: [Quest], position: Int) {
        self.quests = quests
        self.position = position
    }
    
    internal func getQuests() -> [Quest] {
        return self.quests
    }
    
    internal func getPosition() -> Int {
        return self.position
    }
}
