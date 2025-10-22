import Foundation



internal func makeIlCacciatoreChallenges() -> [Challenge<String>] {
    return [
        Challenge<String>(
            name: "OUTFIT.THE_SURVIVALIST_FROM_HANOI.THE_HUNTER.FACE_TO_FACE.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.THE_SURVIVALIST_FROM_HANOI.THE_HUNTER.FACE_TO_FACE.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.THE_SURVIVALIST_FROM_HANOI.THE_HUNTER.FACE_TO_FACE.Requirement1".fromLocalized(),
                    tag: "OUTFIT.THE_SURVIVALIST_FROM_HANOI.THE_HUNTER.FACE_TO_FACE.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: []
        ),
        
        Challenge<String>(
            name: "OUTFIT.THE_SURVIVALIST_FROM_HANOI.THE_HUNTER.MATADOR.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.THE_SURVIVALIST_FROM_HANOI.THE_HUNTER.MATADOR.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.THE_SURVIVALIST_FROM_HANOI.THE_HUNTER.MATADOR.Requirement1".fromLocalized(),
                    tag: "OUTFIT.THE_SURVIVALIST_FROM_HANOI.THE_HUNTER.MATADOR.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: []
        ),
        
        Challenge<String>(
            name: "OUTFIT.THE_SURVIVALIST_FROM_HANOI.THE_HUNTER.TRAPPER.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.THE_SURVIVALIST_FROM_HANOI.THE_HUNTER.TRAPPER.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.THE_SURVIVALIST_FROM_HANOI.THE_HUNTER.TRAPPER.Requirement1".fromLocalized(),
                    tag: "OUTFIT.THE_SURVIVALIST_FROM_HANOI.THE_HUNTER.TRAPPER.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [
                Challenge<String>.TaggedString(
                    "OUTFIT.THE_SURVIVALIST_FROM_HANOI.THE_HUNTER.TRAPPER.Dont1".fromLocalized(),
                    tag: "OUTFIT.THE_SURVIVALIST_FROM_HANOI.THE_HUNTER.TRAPPER.Dont1Tag".fromLocalized()
                )
            ],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.THE_SURVIVALIST_FROM_HANOI.THE_HUNTER.TRAPPER.ProTip1".fromLocalized(),
                    tag: "OUTFIT.THE_SURVIVALIST_FROM_HANOI.THE_HUNTER.TRAPPER.ProTip1Tag".fromLocalized()
                ),
                
                Challenge<String>.TaggedString(
                    "OUTFIT.THE_SURVIVALIST_FROM_HANOI.THE_HUNTER.TRAPPER.ProTip2".fromLocalized(),
                    tag: "OUTFIT.THE_SURVIVALIST_FROM_HANOI.THE_HUNTER.TRAPPER.ProTip2Tag".fromLocalized()
                ),
                
                Challenge<String>.TaggedString(
                    "OUTFIT.THE_SURVIVALIST_FROM_HANOI.THE_HUNTER.TRAPPER.ProTip3".fromLocalized(),
                    tag: "OUTFIT.THE_SURVIVALIST_FROM_HANOI.THE_HUNTER.TRAPPER.ProTip3Tag".fromLocalized()
                ),
            ]
        )
    ]
}

