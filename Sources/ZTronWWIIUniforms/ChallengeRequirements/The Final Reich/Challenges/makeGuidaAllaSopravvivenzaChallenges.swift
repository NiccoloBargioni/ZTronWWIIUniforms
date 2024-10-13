import Foundation
import LoremIpsum

internal func makeGuidaAllaSopravvivenzaChallenges() -> [Challenge<String>] {
    return [
        Challenge<String>(
            name: "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.NO_TOUCHING.ChallengeName".fromLocalized(),
            map: "the final reich",
            riddle: "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.NO_TOUCHING.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.NO_TOUCHING.Requirement1".fromLocalized(),
                    tag: "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.NO_TOUCHING.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: []
        ),
        
        Challenge<String>(
            name: "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.LUDDITE.ChallengeName".fromLocalized(),
            map: "the final reich",
            riddle: "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.LUDDITE.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.LUDDITE.Requirement1".fromLocalized(),
                    tag: "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.LUDDITE.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: []
        ),
        
        Challenge<String>(
            name: "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.IN_THE_DARK.ChallengeName".fromLocalized(),
            map: "the final reich",
            riddle: "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.IN_THE_DARK.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.IN_THE_DARK.Requirement1".fromLocalized(),
                    tag: "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.IN_THE_DARK.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.IN_THE_DARK.ProTip1".fromLocalized(),
                    tag: "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.IN_THE_DARK.ProTip1Tag".fromLocalized()
                )
            ]
        ),
        
        Challenge<String>(
            name: "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.I_LOVE_MY_GUN.ChallengeName".fromLocalized(),
            map: "the final reich",
            riddle: "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.I_LOVE_MY_GUN.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.I_LOVE_MY_GUN.Requirement1".fromLocalized(),
                    tag: "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.I_LOVE_MY_GUN.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.I_LOVE_MY_GUN.ProTip1".fromLocalized(),
                    tag: "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.I_LOVE_MY_GUN.ProTip1Tag".fromLocalized()
                )
            ]
        ),
        
        Challenge<String>(
            name: "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.ROLL_THE_DICE.ChallengeName".fromLocalized(),
            map: "the final reich",
            riddle: "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.ROLL_THE_DICE.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.ROLL_THE_DICE.Requirement1".fromLocalized(),
                    tag: "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.ROLL_THE_DICE.Requirement1Tag".fromLocalized()
                ),
                
                Challenge<String>.TaggedString(
                    "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.ROLL_THE_DICE.Requirement2".fromLocalized(),
                    tag: "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.ROLL_THE_DICE.Requirement2Tag".fromLocalized()
                ),
            ],
            donts: [
                
            ],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.ROLL_THE_DICE.ProTip1".fromLocalized(),
                    tag: "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.ROLL_THE_DICE.ProTip1Tag".fromLocalized()
                ),
                
                Challenge<String>.TaggedString(
                    "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.ROLL_THE_DICE.ProTip2".fromLocalized(),
                    tag: "OUTFIT.SURVIVALIST.SURVIVAL_GUIDE.ROLL_THE_DICE.ProTip2Tag".fromLocalized()
                )
            ]
        )
    ]
}
