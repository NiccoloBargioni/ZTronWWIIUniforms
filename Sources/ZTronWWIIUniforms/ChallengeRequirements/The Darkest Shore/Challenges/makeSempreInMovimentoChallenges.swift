import Foundation
import LoremIpsum

internal func makeSempreInMovimentoChallenges() -> [Challenge<String>] {
    return  [
        Challenge<String>(
            name: "OUTFIT.DEATHRAVEN_MOUNTAINEER.KEEP_MOVING.BURNING_DESIRE.ChallengeName".fromLocalized(),
            map: "the final reich",
            riddle: "OUTFIT.DEATHRAVEN_MOUNTAINEER.KEEP_MOVING.BURNING_DESIRE.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHRAVEN_MOUNTAINEER.KEEP_MOVING.BURNING_DESIRE.Requirement1".fromLocalized(),
                    tag: "OUTFIT.DEATHRAVEN_MOUNTAINEER.KEEP_MOVING.BURNING_DESIRE.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHRAVEN_MOUNTAINEER.KEEP_MOVING.BURNING_DESIRE.ProTip1".fromLocalized(),
                    tag: "OUTFIT.DEATHRAVEN_MOUNTAINEER.KEEP_MOVING.BURNING_DESIRE.ProTip1Tag".fromLocalized()
                ),
            ]
        ),
        
        Challenge<String>(
            name: "OUTFIT.DEATHRAVEN_MOUNTAINEER.KEEP_MOVING.FRYING_PAN.ChallengeName".fromLocalized(),
            map: "the final reich",
            riddle: "OUTFIT.DEATHRAVEN_MOUNTAINEER.KEEP_MOVING.FRYING_PAN.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHRAVEN_MOUNTAINEER.KEEP_MOVING.FRYING_PAN.Requirement1".fromLocalized(),
                    tag: "OUTFIT.DEATHRAVEN_MOUNTAINEER.KEEP_MOVING.FRYING_PAN.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHRAVEN_MOUNTAINEER.KEEP_MOVING.FRYING_PAN.ProTip1".fromLocalized(),
                    tag: "OUTFIT.DEATHRAVEN_MOUNTAINEER.KEEP_MOVING.FRYING_PAN.ProTip1Tag".fromLocalized()
                ),
            ]
        ),
        
        Challenge<String>(
            name: "OUTFIT.DEATHRAVEN_MOUNTAINEER.KEEP_MOVING.UNDER_PRESSURE.ChallengeName".fromLocalized(),
            map: "the final reich",
            riddle: "OUTFIT.DEATHRAVEN_MOUNTAINEER.KEEP_MOVING.UNDER_PRESSURE.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHRAVEN_MOUNTAINEER.KEEP_MOVING.UNDER_PRESSURE.Requirement1".fromLocalized(),
                    tag: "OUTFIT.DEATHRAVEN_MOUNTAINEER.KEEP_MOVING.UNDER_PRESSURE.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHRAVEN_MOUNTAINEER.KEEP_MOVING.UNDER_PRESSURE.Dont1".fromLocalized(),
                    tag: "OUTFIT.DEATHRAVEN_MOUNTAINEER.KEEP_MOVING.UNDER_PRESSURE.Dont1Tag".fromLocalized()
                ),
            ],
            glitches: [],
            proTips: []
        ),
    ]
}
