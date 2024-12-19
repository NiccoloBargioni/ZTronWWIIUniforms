import Foundation
import LoremIpsum

internal func makeAlComandoChallenges() -> [Challenge<String>] {
    return [
        Challenge<String>(
            name: "OUTFIT.BLOODRAVEN_SURVIVALIST.IN_CHARGE.IRON_LEGS.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.BLOODRAVEN_SURVIVALIST.IN_CHARGE.IRON_LEGS.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_SURVIVALIST.IN_CHARGE.IRON_LEGS.Requirement1".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_SURVIVALIST.IN_CHARGE.IRON_LEGS.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_SURVIVALIST.IN_CHARGE.IRON_LEGS.ProTip1".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_SURVIVALIST.IN_CHARGE.IRON_LEGS.ProTip1Tag".fromLocalized()
                ),
            ]
        ),
        
        Challenge<String>(
            name: "OUTFIT.BLOODRAVEN_SURVIVALIST.IN_CHARGE.HEAD_OF_THE_SPEAR.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.BLOODRAVEN_SURVIVALIST.IN_CHARGE.HEAD_OF_THE_SPEAR.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_SURVIVALIST.IN_CHARGE.HEAD_OF_THE_SPEAR.Requirement1".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_SURVIVALIST.IN_CHARGE.HEAD_OF_THE_SPEAR.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: []
        ),
        
        Challenge<String>(
            name: "OUTFIT.BLOODRAVEN_SURVIVALIST.IN_CHARGE.STATIC_BUILDUP.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.BLOODRAVEN_SURVIVALIST.IN_CHARGE.STATIC_BUILDUP.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_SURVIVALIST.IN_CHARGE.STATIC_BUILDUP.Requirement1".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_SURVIVALIST.IN_CHARGE.STATIC_BUILDUP.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: []
        )
    ]
}

