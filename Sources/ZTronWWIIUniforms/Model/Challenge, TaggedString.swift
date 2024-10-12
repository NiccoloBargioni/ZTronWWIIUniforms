import Foundation
import LoremIpsum

internal class Challenge<Tag>: Hashable, Identifiable where Tag: Hashable {
    private let name: String
    private let map: String
    private let riddle: String
    private let requirements: [TaggedString]
    private let donts: [TaggedString]
    private let glitches: [TaggedString]
    private let proTips: [TaggedString]
    internal let id: String
    
    init(
        name: String,
        map: String,
        riddle: String,
        requirements: [TaggedString],
        donts: [TaggedString],
        glitches: [TaggedString],
        proTips: [TaggedString]
    ) {
        self.name = name.capitalized
        self.map = map
        self.riddle = riddle
        self.requirements = requirements
        self.donts = donts
        self.glitches = glitches
        self.proTips = proTips
        self.id = self.name + self.riddle
    }
    
    internal func getName() -> String {
        return self.name
    }
    
    internal func getMap() -> String {
        return self.map
    }
    
    internal func getRiddle() -> String {
        return self.riddle
    }
    
    internal func getRequirements() -> [TaggedString] {
        return self.requirements
    }
    
    internal func getDonts() -> [TaggedString] {
        return self.donts
    }
    
    internal func getGlitches() -> [TaggedString] {
        return self.glitches
    }
    
    internal func getProTips() -> [TaggedString] {
        return self.proTips
    }
    
    internal static func == (_ lhs: Challenge, rhs: Challenge) -> Bool {
        return lhs.name == rhs.name && lhs.riddle == rhs.riddle
    }
    
    internal func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
        hasher.combine(self.riddle)
    }
    
    internal struct TaggedString: Hashable {
        private let string: String
        private let tag: Tag
        
        init(_ string: String, tag: Tag) {
            self.string = string
            self.tag = tag
        }
        
        internal func wrappedValue() -> String {
            return self.string
        }
        
        internal func getTag() -> Tag {
            return self.tag
        }
        
        internal static func == (_ lhs: TaggedString, _ rhs: TaggedString) -> Bool {
            return lhs.tag == rhs.tag && lhs.string == rhs.string
        }
        
        internal func hash(into hasher: inout Hasher) {
            hasher.combine(string)
            hasher.combine(tag)
        }
    }
}
