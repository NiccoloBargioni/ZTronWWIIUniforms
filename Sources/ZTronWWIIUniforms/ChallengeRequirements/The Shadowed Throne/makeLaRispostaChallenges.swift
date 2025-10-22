import Foundation



internal func makeLaRispostaChallenges() -> [Challenge<String>] {
    return [
        Challenge<String>(
            name: "OUTFIT.SKULLBREAKER.THE_ANSWER.CRUSH_THEM_QUICK.ChallengeName".fromLocalized(),
            map: "the shadowed throne",
            riddle: "OUTFIT.SKULLBREAKER.THE_ANSWER.CRUSH_THEM_QUICK.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.SKULLBREAKER.THE_ANSWER.CRUSH_THEM_QUICK.Requirement1".fromLocalized(),
                    tag: "OUTFIT.SKULLBREAKER.THE_ANSWER.CRUSH_THEM_QUICK.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.SKULLBREAKER.THE_ANSWER.CRUSH_THEM_QUICK.ProTip1".fromLocalized(),
                    tag: "OUTFIT.SKULLBREAKER.THE_ANSWER.CRUSH_THEM_QUICK.ProTip1Tag".fromLocalized()
                )
            ]
        ),
        
        Challenge<String>(
            name: "OUTFIT.SKULLBREAKER.THE_ANSWER.TIME_CRUNCHER.ChallengeName".fromLocalized(),
            map: "the shadowed throne",
            riddle: "OUTFIT.SKULLBREAKER.THE_ANSWER.TIME_CRUNCHER.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.SKULLBREAKER.THE_ANSWER.TIME_CRUNCHER.Requirement1".fromLocalized(),
                    tag: "OUTFIT.SKULLBREAKER.THE_ANSWER.TIME_CRUNCHER.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: (1...10).map { i in
                return Challenge<String>.TaggedString(
                    "OUTFIT.SKULLBREAKER.THE_ANSWER.TIME_CRUNCHER.ProTip\(i)".fromLocalized(),
                    tag: "OUTFIT.SKULLBREAKER.THE_ANSWER.TIME_CRUNCHER.ProTip\(i)Tag".fromLocalized()
                )
            }
        ),
        
        
        Challenge<String>(
            name: "OUTFIT.SKULLBREAKER.THE_ANSWER.FIGHT_FAIR.ChallengeName".fromLocalized(),
            map: "the shadowed throne",
            riddle: "OUTFIT.SKULLBREAKER.THE_ANSWER.FIGHT_FAIR.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.SKULLBREAKER.THE_ANSWER.FIGHT_FAIR.Requirement1".fromLocalized(),
                    tag: "OUTFIT.SKULLBREAKER.THE_ANSWER.FIGHT_FAIR.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: []
        ),
        
        Challenge<String>(
            name: "OUTFIT.SKULLBREAKER.THE_ANSWER.SET_THE_STAGE.ChallengeName".fromLocalized(),
            map: "the shadowed throne",
            riddle: "OUTFIT.SKULLBREAKER.THE_ANSWER.SET_THE_STAGE.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.SKULLBREAKER.THE_ANSWER.SET_THE_STAGE.Requirement1".fromLocalized(),
                    tag: "OUTFIT.SKULLBREAKER.THE_ANSWER.SET_THE_STAGE.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.SKULLBREAKER.THE_ANSWER.SET_THE_STAGE.ProTip1".fromLocalized(),
                    tag: "OUTFIT.SKULLBREAKER.THE_ANSWER.SET_THE_STAGE.ProTip1Tag".fromLocalized()
                )
            ]
        ),
        
        Challenge<String>(
            name: "OUTFIT.SKULLBREAKER.THE_ANSWER.DOWN_THE_SIGHT.ChallengeName".fromLocalized(),
            map: "the shadowed throne",
            riddle: "OUTFIT.SKULLBREAKER.THE_ANSWER.DOWN_THE_SIGHT.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.SKULLBREAKER.THE_ANSWER.DOWN_THE_SIGHT.Requirement1".fromLocalized(),
                    tag: "OUTFIT.SKULLBREAKER.THE_ANSWER.DOWN_THE_SIGHT.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.SKULLBREAKER.THE_ANSWER.DOWN_THE_SIGHT.ProTip1".fromLocalized(),
                    tag: "OUTFIT.SKULLBREAKER.THE_ANSWER.DOWN_THE_SIGHT.ProTip1Tag".fromLocalized()
                )
            ]
        )
    ]
}


