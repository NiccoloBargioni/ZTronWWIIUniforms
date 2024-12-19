import Foundation
import LoremIpsum

internal func makeBarbarossaChallenges() -> [Challenge<String>] {
    return [
        Challenge<String>(
            name: "OUTFIT.THE_MOUNTAINEER_FROM_RUSKEALA.BARBAROSSA.UNTARNISHED_PROPERTY.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.THE_MOUNTAINEER_FROM_RUSKEALA.BARBAROSSA.UNTARNISHED_PROPERTY.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.THE_MOUNTAINEER_FROM_RUSKEALA.BARBAROSSA.UNTARNISHED_PROPERTY.Requirement1".fromLocalized(),
                    tag: "OUTFIT.THE_MOUNTAINEER_FROM_RUSKEALA.BARBAROSSA.UNTARNISHED_PROPERTY.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.THE_MOUNTAINEER_FROM_RUSKEALA.BARBAROSSA.UNTARNISHED_PROPERTY.ProTip1".fromLocalized(),
                    tag: "OUTFIT.THE_MOUNTAINEER_FROM_RUSKEALA.BARBAROSSA.UNTARNISHED_PROPERTY.ProTip1Tag".fromLocalized()
                ),
            ]
        ),
        
        Challenge<String>(
            name: "OUTFIT.THE_MOUNTAINEER_FROM_RUSKEALA.BARBAROSSA.ULTIMATE_POWER.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.THE_MOUNTAINEER_FROM_RUSKEALA.BARBAROSSA.ULTIMATE_POWER.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.THE_MOUNTAINEER_FROM_RUSKEALA.BARBAROSSA.ULTIMATE_POWER.Requirement1".fromLocalized(),
                    tag: "OUTFIT.THE_MOUNTAINEER_FROM_RUSKEALA.BARBAROSSA.ULTIMATE_POWER.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.THE_MOUNTAINEER_FROM_RUSKEALA.BARBAROSSA.ULTIMATE_POWER.ProTip1".fromLocalized(),
                    tag: "OUTFIT.THE_MOUNTAINEER_FROM_RUSKEALA.BARBAROSSA.ULTIMATE_POWER.ProTip1Tag".fromLocalized()
                ),
            ]
        ),
        
        Challenge<String>(
            name: "OUTFIT.THE_MOUNTAINEER_FROM_RUSKEALA.BARBAROSSA.TOOLS_OF_THE_TRADE.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.THE_MOUNTAINEER_FROM_RUSKEALA.BARBAROSSA.TOOLS_OF_THE_TRADE.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.THE_MOUNTAINEER_FROM_RUSKEALA.BARBAROSSA.TOOLS_OF_THE_TRADE.Requirement1".fromLocalized(),
                    tag: "OUTFIT.THE_MOUNTAINEER_FROM_RUSKEALA.BARBAROSSA.TOOLS_OF_THE_TRADE.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: []
        ),
        
        
    ]
}

