import Foundation
import LoremIpsum

func makeGroestenHausSurvivalChallenges() -> [Challenge<String>] {
    return [
        Challenge<String>(
            name: LoremIpsum.word,
            map: "the final reich",
            riddle: LoremIpsum.sentence,
            requirements: [Challenge<String>.TaggedString(LoremIpsum.word, tag: "requirement 1")],
            donts: [],
            glitches: [],
            proTips: []
        )
    ]
}
