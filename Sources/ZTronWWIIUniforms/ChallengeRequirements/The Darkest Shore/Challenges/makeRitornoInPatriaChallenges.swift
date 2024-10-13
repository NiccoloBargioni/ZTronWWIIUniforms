import Foundation
import LoremIpsum

internal func makeRitornoInPatriaChallenges() -> [Challenge<String>] {
    return [
        Challenge<String>(
            name: "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.THIS_IS_MY_HAUS.ChallengeName".fromLocalized(),
            map: "sopravvivenza",
            riddle: "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.THIS_IS_MY_HAUS.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.THIS_IS_MY_HAUS.Requirement1".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.THIS_IS_MY_HAUS.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: []
        ),
        
        Challenge<String>(
            name: "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.MINT_CONDITION.ChallengeName".fromLocalized(),
            map: "sopravvivenza",
            riddle: "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.MINT_CONDITION.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.MINT_CONDITION.Requirement1".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.MINT_CONDITION.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.MINT_CONDITION.Dont1".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.MINT_CONDITION.Dont1Tag"
                ),
                
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.MINT_CONDITION.Dont2".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.MINT_CONDITION.Dont2Tag"
                )
            ],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.MINT_CONDITION.ProTip1".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.MINT_CONDITION.ProTip1Tag"
                ),
                
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.MINT_CONDITION.ProTip2".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.MINT_CONDITION.ProTip2Tag"
                ),
                
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.MINT_CONDITION.ProTip3".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.MINT_CONDITION.ProTip3Tag"
                )
            ]
        ),
        
        Challenge<String>(
            name: String(localized: "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.KING_OF_THE_CASTLE.ChallengeName"),
            map: "sopravvivenza",
            riddle: "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.KING_OF_THE_CASTLE.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.KING_OF_THE_CASTLE.Requirement1".fromLocalized(),
                    tag: "OUTFIT.BLOODRAVEN_MOUNTAINEER.HOME_WARD.KING_OF_THE_CASTLE.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: []
        ),
    ]
}
