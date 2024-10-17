import Foundation
import LoremIpsum

public final class Challenge<Tag>: Hashable, Identifiable, Sendable where Tag: Hashable & Sendable {
    private let name: String
    private let map: String
    private let riddle: String
    private let requirements: [TaggedString]
    private let donts: [TaggedString]
    private let glitches: [TaggedString]
    private let proTips: [TaggedString]
    public let id: String
    
    init(
        name: String,
        map: String,
        riddle: String,
        requirements: [TaggedString],
        donts: [TaggedString],
        glitches: [TaggedString],
        proTips: [TaggedString]
    ) {
        self.name = name
        self.map = map
        self.riddle = riddle
        self.requirements = requirements
        self.donts = donts
        self.glitches = glitches
        self.proTips = proTips
        self.id = self.name + self.riddle
    }
    
    public func getName() -> String {
        return String(localized: String.LocalizationValue(stringLiteral: self.name), bundle: .module).capitalized
    }
    
    public func getMap() -> String {
        return self.map
    }
    
    public func getRiddle() -> String {
        return String(localized: String.LocalizationValue(stringLiteral: self.riddle), bundle: .module)
    }
    
    public func getRequirements() -> [TaggedString] {
        return self.requirements
    }
    
    public func getDonts() -> [TaggedString] {
        return self.donts
    }
    
    public func getGlitches() -> [TaggedString] {
        return self.glitches
    }
    
    public func getProTips() -> [TaggedString] {
        return self.proTips
    }
    
    public static func == (_ lhs: Challenge, rhs: Challenge) -> Bool {
        return lhs.name == rhs.name && lhs.riddle == rhs.riddle
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
        hasher.combine(self.riddle)
    }
    
    public struct TaggedString: Hashable, Sendable {
        private let string: String
        private let tag: Tag
        
        init(_ string: String, tag: Tag) {
            self.string = string
            self.tag = tag
        }
        
        public func wrappedValue() -> String {
            return String(localized: String.LocalizationValue(stringLiteral: self.string), bundle: .module)
        }
        
        public func getTag() -> Tag {
            return self.tag
        }
        
        public static func == (_ lhs: TaggedString, _ rhs: TaggedString) -> Bool {
            return lhs.tag == rhs.tag && lhs.string == rhs.string
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(string)
            hasher.combine(tag)
        }
    }
}
