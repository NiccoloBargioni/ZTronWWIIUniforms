import Foundation
import LoremIpsum

func makeMockArray() -> [Challenge<String>.TaggedString] {
    var shuffledInterval = Array(0...15).shuffled()
    
    return Array(0..<Int.random(in: 2...10)).map { _ in
        let randomElement = shuffledInterval.remove(at: Int.random(in: 0..<shuffledInterval.count))
        
        return Challenge<String>.TaggedString(
            LoremIpsum.sentence,
            tag: "requirement \(randomElement)"
        )
    }
}

internal func makeBanchiereChallenges() -> [Challenge<String>] {
    
    return Array((0..<Int.random(in: 2...10))).map { _ in
        return Challenge<String>(
            name: LoremIpsum.word,
            map: "the darkest shore",
            riddle: LoremIpsum.sentence,
            requirements: makeMockArray(),
            donts: makeMockArray(),
            glitches: makeMockArray(),
            proTips: makeMockArray()
        )
    }
}

