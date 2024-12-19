import Foundation
import LoremIpsum

internal func makeVIBChallenges() -> [Challenge<String>] {
    return [
        Challenge<String>(
            name: "OUTFIT.BLOODRAVEN_SLAYER.V.I.B.SECRET_SERVICE.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.BLOODRAVEN_SLAYER.V.I.B.SECRET_SERVICE.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_SLAYER.V.I.B.SECRET_SERVICE.Requirement1".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_SLAYER.V.I.B.SECRET_SERVICE.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: []
        ),
        
        Challenge<String>(
            name: "OUTFIT.BLOODRAVEN_SLAYER.V.I.B.BOMBS_AWAY.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.BLOODRAVEN_SLAYER.V.I.B.BOMBS_AWAY.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_SLAYER.V.I.B.BOMBS_AWAY.Requirement1".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_SLAYER.V.I.B.BOMBS_AWAY.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_SLAYER.V.I.B.BOMBS_AWAY.ProTip1".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_SLAYER.V.I.B.BOMBS_AWAY.ProTip1Tag".fromLocalized()
                )
            ]
        ),
        
        Challenge<String>(
            name: "OUTFIT.BLOODRAVEN_SLAYER.V.I.B.MOLE_KING.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.BLOODRAVEN_SLAYER.V.I.B.MOLE_KING.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_SLAYER.V.I.B.MOLE_KING.Requirement1".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_SLAYER.V.I.B.MOLE_KING.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_SLAYER.V.I.B.MOLE_KING.ProTip1".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_SLAYER.V.I.B.MOLE_KING.ProTip1Tag".fromLocalized()
                ),
                
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_SLAYER.V.I.B.MOLE_KING.ProTip2".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_SLAYER.V.I.B.MOLE_KING.ProTip2Tag".fromLocalized()
                )
            ]
        ),
        
        
        
    ]
}

