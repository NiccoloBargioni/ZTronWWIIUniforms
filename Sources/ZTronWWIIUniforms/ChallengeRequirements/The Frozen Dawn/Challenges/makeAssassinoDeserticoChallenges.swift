import Foundation
import LoremIpsum

internal func makeAssassinoDeserticoChallenges() -> [Challenge<String>] {
    return [
        Challenge<String>(
            name: "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.SOME_THINGS_ARE_BEST.ChallengeName".fromLocalized(),
            map: "the frozen dawn",
            riddle: "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.SOME_THINGS_ARE_BEST.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.SOME_THINGS_ARE_BEST.Requirement1".fromLocalized(),
                    tag: "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.SOME_THINGS_ARE_BEST.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: []
        ),
        
        Challenge<String>(
            name: "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.BLOODIED_SACRIFICE.ChallengeName".fromLocalized(),
            map: "the frozen dawn",
            riddle: "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.BLOODIED_SACRIFICE.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.BLOODIED_SACRIFICE.Requirement1".fromLocalized(),
                    tag: "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.BLOODIED_SACRIFICE.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: []
        ),
        
        Challenge<String>(
            name: "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.ZOMBIE_TORERO.ChallengeName".fromLocalized(),
            map: "the frozen dawn",
            riddle: "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.ZOMBIE_TORERO.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.ZOMBIE_TORERO.Requirement1".fromLocalized(),
                    tag: "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.ZOMBIE_TORERO.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: []
        ),
        
        Challenge<String>(
            name: "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.STALWART_SOLDIER.ChallengeName".fromLocalized(),
            map: "the frozen dawn",
            riddle: "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.STALWART_SOLDIER.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.STALWART_SOLDIER.Requirement1".fromLocalized(),
                    tag: "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.STALWART_SOLDIER.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.STALWART_SOLDIER.ProTip1".fromLocalized(),
                    tag: "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.STALWART_SOLDIER.ProTip1Tag".fromLocalized()
                ),
                
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.STALWART_SOLDIER.ProTip2".fromLocalized(),
                    tag: "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.STALWART_SOLDIER.ProTip2Tag".fromLocalized()
                ),
            ]
        ),
        
        Challenge<String>(
            name: "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.BLOOD_IS_POWER.ChallengeName".fromLocalized(),
            map: "the frozen dawn",
            riddle: "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.BLOOD_IS_POWER.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.BLOOD_IS_POWER.Requirement1".fromLocalized(),
                    tag: "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.BLOOD_IS_POWER.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.BLOOD_IS_POWER.ProTip1OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.BLOOD_IS_POWER.ProTip1".fromLocalized(),
                    tag: "OUTFIT.DEATHBRINGER.DESERT_ASSASSIN.BLOOD_IS_POWER.ProTip1Tag".fromLocalized()
                )
            ]
        ),
    ]
}


