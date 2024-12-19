import Foundation
import LoremIpsum

internal func makeCollezionistaDiAntichitaChallenges() -> [Challenge<String>] {
    return [
        Challenge<String>(
            name: "OUTFIT.BLOODRAVEN_HUNTER.ANTIQUE_COLLECTOR.LOST_CHANGE.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.BLOODRAVEN_HUNTER.ANTIQUE_COLLECTOR.LOST_CHANGE.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_HUNTER.ANTIQUE_COLLECTOR.LOST_CHANGE.Requirement1".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_HUNTER.ANTIQUE_COLLECTOR.LOST_CHANGE.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_HUNTER.ANTIQUE_COLLECTOR.LOST_CHANGE.ProTip1".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_HUNTER.ANTIQUE_COLLECTOR.LOST_CHANGE.ProTip1Tag".fromLocalized()
                ),
            ]
        ),
        
        Challenge<String>(
            name: "OUTFIT.BLOODRAVEN_HUNTER.ANTIQUE_COLLECTOR.LUNCH_MONEY.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.BLOODRAVEN_HUNTER.ANTIQUE_COLLECTOR.LUNCH_MONEY.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_HUNTER.ANTIQUE_COLLECTOR.LUNCH_MONEY.Requirement1".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_HUNTER.ANTIQUE_COLLECTOR.LUNCH_MONEY.Requirement1".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_HUNTER.ANTIQUE_COLLECTOR.LUNCH_MONEY.ProTip1".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_HUNTER.ANTIQUE_COLLECTOR.LUNCH_MONEY.ProTip1Tag".fromLocalized()
                ),
            ]
        ),
        
        Challenge<String>(
            name: "OUTFIT.BLOODRAVEN_HUNTER.ANTIQUE_COLLECTOR.APEX_PREDATOR.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.BLOODRAVEN_HUNTER.ANTIQUE_COLLECTOR.APEX_PREDATOR.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_HUNTER.ANTIQUE_COLLECTOR.APEX_PREDATOR.Requirement1".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_HUNTER.ANTIQUE_COLLECTOR.APEX_PREDATOR.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_HUNTER.ANTIQUE_COLLECTOR.APEX_PREDATOR.ProTip1".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_HUNTER.ANTIQUE_COLLECTOR.APEX_PREDATOR.ProTip1Tag".fromLocalized()
                ),
            ]
        )
    ]
}
