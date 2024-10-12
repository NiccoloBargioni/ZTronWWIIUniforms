import Foundation
import LoremIpsum

internal func makeInMissioneChallenges() -> [Challenge<String>] {
    return [
        Challenge<String>(
            name: "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.SEASONED.ChallengeName".fromLocalized(),
            map: "the final reich",
            riddle: "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.SEASONED.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.SEASONED.Requirement1".fromLocalized(),
                    tag: "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.SEASONED.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: []
        ),
        
        Challenge<String>(
            name: "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.SEE_YOU_AT_THE_PARTY.ChallengeName".fromLocalized(),
            map: "the final reich",
            riddle: "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.SEE_YOU_AT_THE_PARTY.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.SEE_YOU_AT_THE_PARTY.Requirement1".fromLocalized(),
                    tag: "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.SEE_YOU_AT_THE_PARTY.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.SEE_YOU_AT_THE_PARTY.ProTip1".fromLocalized(),
                    tag: "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.SEE_YOU_AT_THE_PARTY.ProTip1Tag".fromLocalized()
                ),
            ]
        ),
        
        Challenge<String>(
            name: "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.COOKING_WITH_GAS.ChallengeName".fromLocalized(),
            map: "the final reich",
            riddle: "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.COOKING_WITH_GAS.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.COOKING_WITH_GAS.Requirement1".fromLocalized(),
                    tag: "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.COOKING_WITH_GAS.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: []
        ),
        
        
        Challenge<String>(
            name: "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.LIGHTNING_FAST.ChallengeName".fromLocalized(),
            map: "the final reich",
            riddle: "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.LIGHTNING_FAST.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.LIGHTNING_FAST.Requirement1".fromLocalized(),
                    tag: "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.LIGHTNING_FAST.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.LIGHTNING_FAST.ProTip1".fromLocalized(),
                    tag: "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.LIGHTNING_FAST.ProTip1Tag".fromLocalized()
                )
            ]
        ),
        
        Challenge<String>(
            name: "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.DID_YOU_SEE_THAT...?.ChallengeName".fromLocalized(),
            map: "the final reich",
            riddle: "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.DID_YOU_SEE_THAT...?.ChallengeName.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.DID_YOU_SEE_THAT...?.ChallengeName.Requirement1".fromLocalized(),
                    tag: "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.DID_YOU_SEE_THAT...?.ChallengeName.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.DID_YOU_SEE_THAT...?.ChallengeName.ProTip1".fromLocalized(),
                    tag: "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.DID_YOU_SEE_THAT...?.ChallengeName.ProTip1Tag".fromLocalized()
                ),
                
                Challenge<String>.TaggedString(
                    "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.DID_YOU_SEE_THAT...?.ChallengeName.ProTip2".fromLocalized(),
                    tag: "OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.DID_YOU_SEE_THAT...?.ChallengeName.ProTip2Tag".fromLocalized()
                )
            ]
        ),
    ]
}
