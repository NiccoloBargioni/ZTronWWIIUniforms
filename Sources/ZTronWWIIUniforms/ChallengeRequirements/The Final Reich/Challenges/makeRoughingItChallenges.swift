import SwiftUI
import LoremIpsum

internal func makeRoughingItChallenges() -> [Challenge<String>] {
    return [
        // MARK: - LOCKED IN WITH YOU
        Challenge<String>(
            name: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.LOCKED_IN_WITH_YOU.ChallengeName"),
            map: "the final reich",
            riddle: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.LOCKED_IN_WITH_YOU.Riddle"),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.MOUNTAINEER.ROUGHING_IT.LOCKED_IN_WITH_YOU.Requirement1".fromLocalized(),
                    tag: "OUTFIT.MOUNTAINEER.ROUGHING_IT.LOCKED_IN_WITH_YOU.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.MOUNTAINEER.ROUGHING_IT.LOCKED_IN_WITH_YOU.ProTip1".fromLocalized(),
                    tag: "OUTFIT.MOUNTAINEER.ROUGHING_IT.LOCKED_IN_WITH_YOU.ProTip1Tag".fromLocalized()
                )
            ]
        ),
        
        // MARK: - LOCKED IN WITH ME
        Challenge<String>(
            name: "OUTFIT.MOUNTAINEER.ROUGHING_IT.LOCKED_IN_WITH_ME.ChallengeName".fromLocalized(),
            map: "the final reich",
            riddle: "OUTFIT.MOUNTAINEER.ROUGHING_IT.LOCKED_IN_WITH_ME.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.MOUNTAINEER.ROUGHING_IT.LOCKED_IN_WITH_ME.Requirement1".fromLocalized(),
                    tag: "OUTFIT.MOUNTAINEER.ROUGHING_IT.LOCKED_IN_WITH_ME.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.MOUNTAINEER.ROUGHING_IT.LOCKED_IN_WITH_ME.ProTip1".fromLocalized(),
                    tag: "OUTFIT.MOUNTAINEER.ROUGHING_IT.LOCKED_IN_WITH_ME.ProTip1Tag".fromLocalized()
                )
            ]
        ),
    
        // MARK: - WELCOME HOME
        Challenge<String>(
            name: "OUTFIT.MOUNTAINEER.ROUGHING_IT.WELCOME_HOME.ChallengeName".fromLocalized(),
            map: "prologo",
            riddle: "OUTFIT.MOUNTAINEER.ROUGHING_IT.WELCOME_HOME.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.MOUNTAINEER.ROUGHING_IT.WELCOME_HOME.Requirement1".fromLocalized(),
                    tag: "OUTFIT.MOUNTAINEER.ROUGHING_IT.WELCOME_HOME.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.MOUNTAINEER.ROUGHING_IT.WELCOME_HOME.ProTip1".fromLocalized(),
                    tag: "OUTFIT.MOUNTAINEER.ROUGHING_IT.WELCOME_HOME.ProTip1Tag".fromLocalized()
                ),
                
                Challenge<String>.TaggedString(
                    "OUTFIT.MOUNTAINEER.ROUGHING_IT.WELCOME_HOME.ProTip2".fromLocalized(),
                    tag: "OUTFIT.MOUNTAINEER.ROUGHING_IT.WELCOME_HOME.ProTip2Tag".fromLocalized()
                ),
                
                Challenge<String>.TaggedString(
                    "OUTFIT.MOUNTAINEER.ROUGHING_IT.WELCOME_HOME.ProTip3".fromLocalized(),
                    tag: "OUTFIT.MOUNTAINEER.ROUGHING_IT.WELCOME_HOME.ProTip3Tag".fromLocalized()
                ),
            ]
        ),
        
        // MARK: - HOME ADVANTAGE
        Challenge<String>(
            name: "OUTFIT.MOUNTAINEER.ROUGHING_IT.HOME_BDVANTAGE.ChallengeName".fromLocalized(),
            map: "prologo",
            riddle: "OUTFIT.MOUNTAINEER.ROUGHING_IT.HOME_BDVANTAGE.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.MOUNTAINEER.ROUGHING_IT.HOME_BDVANTAGE.Requirement1".fromLocalized(),
                    tag: "OUTFIT.MOUNTAINEER.ROUGHING_IT.HOME_BDVANTAGE.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.MOUNTAINEER.ROUGHING_IT.HOME_BDVANTAGE.ProTip1".fromLocalized(),
                    tag: "OUTFIT.MOUNTAINEER.ROUGHING_IT.HOME_BDVANTAGE.ProTip1Tag".fromLocalized()
                ),
                
                Challenge<String>.TaggedString(
                    "OUTFIT.MOUNTAINEER.ROUGHING_IT.HOME_BDVANTAGE.ProTip2".fromLocalized(),
                    tag: "OUTFIT.MOUNTAINEER.ROUGHING_IT.HOME_BDVANTAGE.ProTip2Tag".fromLocalized()
                ),
                
                Challenge<String>.TaggedString(
                    "OUTFIT.MOUNTAINEER.ROUGHING_IT.HOME_BDVANTAGE.ProTip3".fromLocalized(),
                    tag: "OUTFIT.MOUNTAINEER.ROUGHING_IT.HOME_BDVANTAGE.ProTip3Tag".fromLocalized()
                ),
            ]
        ),
        
        // MARK: - NO CHEATING
        Challenge<String>(
            name: "OUTFIT.MOUNTAINEER.ROUGHING_IT.NO_CHEATING.ChallengeName".fromLocalized(),
            map: "prologo",
            riddle: "OUTFIT.MOUNTAINEER.ROUGHING_IT.NO_CHEATING.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.MOUNTAINEER.ROUGHING_IT.NO_CHEATING.Requirement1".fromLocalized(),
                    tag: "OUTFIT.MOUNTAINEER.ROUGHING_IT.NO_CHEATING.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    "OUTFIT.MOUNTAINEER.ROUGHING_IT.NO_CHEATING.ProTip1".fromLocalized(),
                    tag: "OUTFIT.MOUNTAINEER.ROUGHING_IT.NO_CHEATING.ProTip1Tag".fromLocalized()
                ),
                
                Challenge<String>.TaggedString(
                    "OUTFIT.MOUNTAINEER.ROUGHING_IT.NO_CHEATING.ProTip2".fromLocalized(),
                    tag: "OUTFIT.MOUNTAINEER.ROUGHING_IT.NO_CHEATING.ProTip2Tag".fromLocalized()
                ),
                
                Challenge<String>.TaggedString(
                    "OUTFIT.MOUNTAINEER.ROUGHING_IT.NO_CHEATING.ProTip3".fromLocalized(),
                    tag: "OUTFIT.MOUNTAINEER.ROUGHING_IT.NO_CHEATING.ProTip3Tag".fromLocalized()
                ),
            ]
        )
    ]
}
