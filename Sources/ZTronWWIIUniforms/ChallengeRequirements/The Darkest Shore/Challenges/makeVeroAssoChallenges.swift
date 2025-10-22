import Foundation



internal func makeVeroAssoChallenges() -> [Challenge<String>] {
    return [
        Challenge<String>(
            name: "OUTFIT.DEATHRAVEN_SURVIVALIST.SOL_ACE.BEACH_HEADHUNTER.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.DEATHRAVEN_SURVIVALIST.SOL_ACE.BEACH_HEADHUNTER.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHRAVEN_SURVIVALIST.SOL_ACE.BEACH_HEADHUNTER.Requirement1".fromLocalized(),
                    tag: "OUTFIT.DEATHRAVEN_SURVIVALIST.SOL_ACE.BEACH_HEADHUNTER.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: []
        ),
        
        Challenge<String>(
            name: "OUTFIT.DEATHRAVEN_SURVIVALIST.SOL_ACE.DIG_IT.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.DEATHRAVEN_SURVIVALIST.SOL_ACE.DIG_IT.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHRAVEN_SURVIVALIST.SOL_ACE.DIG_IT.Requirement1".fromLocalized(),
                    tag: "OUTFIT.DEATHRAVEN_SURVIVALIST.SOL_ACE.DIG_IT.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHRAVEN_SURVIVALIST.SOL_ACE.DIG_IT.ProTip1".fromLocalized(),
                    tag: "OUTFIT.DEATHRAVEN_SURVIVALIST.SOL_ACE.DIG_IT.ProTip1Tag".fromLocalized()
                )
            ]
        ),
        
        Challenge<String>(
            name: "OUTFIT.DEATHRAVEN_SURVIVALIST.SOL_ACE.HUNCHBACK.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.DEATHRAVEN_SURVIVALIST.SOL_ACE.HUNCHBACK.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.DEATHRAVEN_SURVIVALIST.SOL_ACE.HUNCHBACK.Requirement1".fromLocalized(),
                    tag: "OUTFIT.DEATHRAVEN_SURVIVALIST.SOL_ACE.HUNCHBACK.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: []
        ),
    ]
}

