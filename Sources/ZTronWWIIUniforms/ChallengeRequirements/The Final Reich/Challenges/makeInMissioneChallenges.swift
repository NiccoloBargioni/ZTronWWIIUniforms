import Foundation
import LoremIpsum

internal func makeInMissioneChallenges() -> [Challenge<String>] {
    return Array((0..<Int.random(in: 2...10))).map { _ in
        return Challenge<String>(
            name: LoremIpsum.word,
            map: "the final reich",
            riddle: LoremIpsum.sentence,
            requirements: [Challenge<String>.TaggedString(LoremIpsum.word, tag: "requirement 1")],
            donts: [],
            glitches: [],
            proTips: []
        )
    }
}
