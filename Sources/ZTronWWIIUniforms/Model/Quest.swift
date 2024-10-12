import Foundation

public class Quest: ObservableObject, Identifiable, Hashable, Equatable {
    private let characterName: String
    private let setName: String
    private let map: String
    private let image: String
    private let challenges: [Challenge<String>]
    public let id: String

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

    public static func == (lhs: Quest, rhs: Quest) -> Bool {
        return lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public func getCharacterName() -> String {
        return self.characterName
    }

    internal func getSetName() -> String {
        return self.setName
    }

    public func getMap() -> String {
        return self.map
    }

    public func getImage() -> String {
        return self.image
    }

    public func getChallenges() -> [Challenge<String>] {
        return self.challenges
    }
}

public class QuestsPositionMapper {
    private let quests: [Quest]
    private let position: Int
    
    internal init(quests: [Quest], position: Int) {
        self.quests = quests
        self.position = position
    }
    
    public func getQuests() -> [Quest] {
        return self.quests
    }
    
    public func getPosition() -> Int {
        return self.position
    }
}
