import Foundation
import LoremIpsum

internal func makeCapitanoDiVascelloChallenges() -> [Challenge<String>] {
    return Array((0..<Int.random(in: 2...10))).map { _ in
        return Challenge<String>(
            name: LoremIpsum.word,
            map: "across the depths",
            riddle: LoremIpsum.sentence,
            requirements: [Challenge<String>.TaggedString(LoremIpsum.word, tag: "requirement 1")],
            donts: [],
            glitches: [],
            proTips: []
        )
    }
}


