import Foundation
import LoremIpsum

internal func makeScavoArcheologicoChallenges() -> [Challenge<String>] {
    return [
        Challenge<String>(
            name: "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.NO_HANDOUTS.ChallengeName".fromLocalized(),
            map: "beneath the ice",
            riddle: "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.NO_HANDOUTS.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.NO_HANDOUTS.Requirement1".fromLocalized(),
                    tag: "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.NO_HANDOUTS.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: []
        ),

        Challenge<String>(
            name: "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.CAREFUL_RESEARCHER.ChallengeName".fromLocalized(),
            map: "beneath the ice",
            riddle: "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.CAREFUL_RESEARCHER.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.CAREFUL_RESEARCHER.Requirement1".fromLocalized(),
                    tag: "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.CAREFUL_RESEARCHER.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.CAREFUL_RESEARCHER.ProTip1".fromLocalized(),
                    tag: "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.CAREFUL_RESEARCHER.ProTip1Tag".fromLocalized()
                )
            ]
        ),
        
        Challenge<String>(
            name: "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.EQUIPMENT_MENACE.ChallengeName".fromLocalized(),
            map: "beneath the ice",
            riddle: "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.EQUIPMENT_MENACE.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.EQUIPMENT_MENACE.Requirement1".fromLocalized(),
                    tag: "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.EQUIPMENT_MENACE.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [
                Challenge<String>.TaggedString(
                    "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.EQUIPMENT_MENACE.Bug1".fromLocalized(),
                    tag: "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.EQUIPMENT_MENACE.Bug1Tag".fromLocalized()
                )
            ],
            proTips: []
        ),

        Challenge<String>(
            name: "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.ASSEMBLER.ChallengeName".fromLocalized(),
            map: "beneath the ice",
            riddle: "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.ASSEMBLER.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.ASSEMBLER.Requirement1".fromLocalized(),
                    tag: "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.ASSEMBLER.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.ASSEMBLER.ProTip1".fromLocalized(),
                    tag: "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.ASSEMBLER.ProTip1Tag".fromLocalized()
                ),
                
                Challenge<String>.TaggedString(
                    "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.ASSEMBLER.ProTip2".fromLocalized(),
                    tag: "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.ASSEMBLER.ProTip2Tag".fromLocalized()
                ),
                
                
            ]
        ),

        
        Challenge<String>(
            name: "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.FAST_HANDS.ChallengeName".fromLocalized(),
            map: "beneath the ice",
            riddle: "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.FAST_HANDS.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.FAST_HANDS.Requirement1".fromLocalized(),
                    tag: "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.FAST_HANDS.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.FAST_HANDS.ProTip2".fromLocalized(),
                    tag: "OUTFIT.IRON_TIGER.ARCHAEOLOGICAL_DIG.FAST_HANDS.ProTip2Tag".fromLocalized()
                ),
            ]
        ),

        
    ]
}
