import Foundation
import LoremIpsum

internal func makeSangueFreddoChallenges() -> [Challenge<String>] {
    return [
        Challenge<String>(
            name: "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_HILT.ChallengeName".fromLocalized(),
            map: "the final reich",
            riddle: "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_HILT.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_HILT.Requirement1".fromLocalized(),
                    tag: "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_HILT.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips:
                (1...12).map { i in
                    return Challenge<String>.TaggedString(
                        "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_HILT.ProTip\(i)".fromLocalized(),
                        tag: "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_HILT.ProTip\(i)Tag".fromLocalized()
                    )
                }
        ),
        
        Challenge<String>(
            name: "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_POMMEL.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_POMMEL.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_POMMEL.Requirement1".fromLocalized(),
                    tag: "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_POMMEL.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips:
                (1...8).map { i in
                    return Challenge<String>.TaggedString(
                        "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_POMMEL.ProTip\(i)".fromLocalized(),
                        tag: "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_POMMEL.ProTip\(i)Tag".fromLocalized()
                    )
                }
        ),
        
        Challenge<String>(
            name: "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_BLADE.ChallengeName".fromLocalized(),
            map: "the shadowed throne",
            riddle: "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_BLADE.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_BLADE.Requirement1".fromLocalized(),
                    tag: "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_BLADE.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips:
                (1...4).map { i in
                    return Challenge<String>.TaggedString(
                        "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_BLADE.ProTip\(i)".fromLocalized(),
                        tag: "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_BLADE.ProTip\(i)Tag".fromLocalized()
                    )
                }
        ),
        
        Challenge<String>(
            name: "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_FORGE.ChallengeName".fromLocalized(),
            map: "the tortured path",
            riddle: "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_FORGE.Riddle".fromLocalized(),
            requirements: (1...3).map { i in
                return Challenge<String>.TaggedString(
                    "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_FORGE.Requirement\(i)".fromLocalized(),
                    tag: "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_FORGE.Requirement\(i)Tag".fromLocalized()
                )
            },
            donts: [],
            glitches: [],
            proTips:
                (1...16).map { i in
                    return Challenge<String>.TaggedString(
                        "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_FORGE.ProTip\(i)".fromLocalized(),
                        tag: "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_FORGE.ProTip\(i)Tag".fromLocalized()
                    )
                }
        ),
        
        Challenge<String>(
            name: "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_ANCIENT_EVIL.ChallengeName".fromLocalized(),
            map: "the frozen dawn",
            riddle: "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_ANCIENT_EVIL.Riddle".fromLocalized(),
            requirements: (1...3).map { i in
                return Challenge<String>.TaggedString(
                    "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_ANCIENT_EVIL.Requirement\(i)".fromLocalized(),
                    tag: "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_ANCIENT_EVIL.Requirement\(i)Tag".fromLocalized()
                )
            },
            donts: [],
            glitches: [],
            proTips:
                (1...5).map { i in
                    return Challenge<String>.TaggedString(
                        "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_ANCIENT_EVIL.ProTip\(i)".fromLocalized(),
                        tag: "OUTFIT.WICHT_WARDEN.COLD_BLOODED.THE_ANCIENT_EVIL.ProTip\(i)Tag".fromLocalized()
                    )
                }
        ),
    ]
}


