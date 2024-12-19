import Foundation
import LoremIpsum

internal func makeVivereIlSognoChallenges() -> [Challenge<String>] {
    return [
        Challenge<String>(
            name: "OUTFIT.DEATHRAVEN_HUNTER.LIVING_THE_DREAM.BRONZING.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.DEATHRAVEN_HUNTER.LIVING_THE_DREAM.BRONZING.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHRAVEN_HUNTER.LIVING_THE_DREAM.BRONZING.Requirement1".fromLocalized(),
                    tag: "OUTFIT.DEATHRAVEN_HUNTER.LIVING_THE_DREAM.BRONZING.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHRAVEN_HUNTER.LIVING_THE_DREAM.BRONZING.ProTip1".fromLocalized(),
                    tag: "OUTFIT.DEATHRAVEN_HUNTER.LIVING_THE_DREAM.BRONZING.ProTip1Tag".fromLocalized()
                ),
            ]
        ),
        
        Challenge<String>(
            name: "OUTFIT.DEATHRAVEN_HUNTER.LIVING_THE_DREAM.STAYING_SAFE.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.DEATHRAVEN_HUNTER.LIVING_THE_DREAM.STAYING_SAFE.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHRAVEN_HUNTER.LIVING_THE_DREAM.STAYING_SAFE.Requirement1".fromLocalized(),
                    tag: "OUTFIT.DEATHRAVEN_HUNTER.LIVING_THE_DREAM.STAYING_SAFE.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHRAVEN_HUNTER.LIVING_THE_DREAM.STAYING_SAFE.ProTip1".fromLocalized(),
                    tag: "OUTFIT.DEATHRAVEN_HUNTER.LIVING_THE_DREAM.STAYING_SAFE.ProTip1Tag".fromLocalized()
                ),
            ]
        ),
        
        
        Challenge<String>(
            name: "OUTFIT.DEATHRAVEN_HUNTER.LIVING_THE_DREAM.OVERWEIGHT.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.DEATHRAVEN_HUNTER.LIVING_THE_DREAM.OVERWEIGHT.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHRAVEN_HUNTER.LIVING_THE_DREAM.OVERWEIGHT.Requirement1".fromLocalized(),
                    tag: "OUTFIT.DEATHRAVEN_HUNTER.LIVING_THE_DREAM.OVERWEIGHT.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHRAVEN_HUNTER.LIVING_THE_DREAM.OVERWEIGHT.ProTip1".fromLocalized(),
                    tag: "OUTFIT.DEATHRAVEN_HUNTER.LIVING_THE_DREAM.OVERWEIGHT.ProTip1Tag".fromLocalized()
                ),
            ]
        ),
    ]
}
