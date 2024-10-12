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
                    String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.LOCKED_IN_WITH_YOU.Requirement1"),
                    tag: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.LOCKED_IN_WITH_YOU.Requirement1Tag")
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.LOCKED_IN_WITH_YOU.ProTip1"),
                    tag: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.LOCKED_IN_WITH_YOU.ProTip1Tag")
                )
            ]
        ),
        
        // MARK: - LOCKED IN WITH ME
        Challenge<String>(
            name: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.LOCKED_IN_WITH_ME.ChallengeName"),
            map: "the final reich",
            riddle: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.LOCKED_IN_WITH_ME.Riddle"),
            requirements: [
                Challenge<String>.TaggedString(
                    String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.LOCKED_IN_WITH_ME.Requirement1"),
                    tag: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.LOCKED_IN_WITH_ME.Requirement1Tag")
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.LOCKED_IN_WITH_ME.ProTip1"),
                    tag: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.LOCKED_IN_WITH_ME.ProTip1Tag")
                )
            ]
        ),
    
        // MARK: - WELCOME HOME
        Challenge<String>(
            name: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.WELCOME_HOME.ChallengeName"),
            map: "prologo",
            riddle: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.WELCOME_HOME.Riddle"),
            requirements: [
                Challenge<String>.TaggedString(
                    String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.WELCOME_HOME.Requirement1"),
                    tag: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.WELCOME_HOME.Requirement1Tag")
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.WELCOME_HOME.ProTip1"),
                    tag: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.WELCOME_HOME.ProTip1Tag")
                ),
                
                Challenge<String>.TaggedString(
                    String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.WELCOME_HOME.ProTip2"),
                    tag: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.WELCOME_HOME.ProTip2Tag")
                ),
                
                Challenge<String>.TaggedString(
                    String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.WELCOME_HOME.ProTip3"),
                    tag: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.WELCOME_HOME.ProTip3Tag")
                ),
            ]
        ),
        
        // MARK: - HOME ADVANTAGE
        Challenge<String>(
            name: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.HOME_ADVANTAGE.ChallengeName"),
            map: "prologo",
            riddle: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.HOME_ADVANTAGE.Riddle"),
            requirements: [
                Challenge<String>.TaggedString(
                    String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.HOME_ADVANTAGE.Requirement1"),
                    tag: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.HOME_ADVANTAGE.Requirement1Tag")
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.HOME_ADVANTAGE.ProTip1"),
                    tag: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.HOME_ADVANTAGE.ProTip1Tag")
                ),
                
                Challenge<String>.TaggedString(
                    String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.HOME_ADVANTAGE.ProTip2"),
                    tag: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.HOME_ADVANTAGE.ProTip2Tag")
                ),
                
                Challenge<String>.TaggedString(
                    String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.HOME_ADVANTAGE.ProTip3"),
                    tag: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.HOME_ADVANTAGE.ProTip3Tag")
                ),
            ]
        ),
        
        // MARK: - NO CHEATING
        Challenge<String>(
            name: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.NO_CHEATING.ChallengeName"),
            map: "prologo",
            riddle: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.NO_CHEATING.Riddle"),
            requirements: [
                Challenge<String>.TaggedString(
                    String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.NO_CHEATING.Requirement1"),
                    tag: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.NO_CHEATING.Requirement1Tag")
                )
            ],
            donts: [],
            glitches: [],
            proTips: [
                Challenge<String>.TaggedString(
                    String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.NO_CHEATING.ProTip1"),
                    tag: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.NO_CHEATING.ProTip1Tag")
                ),
                
                Challenge<String>.TaggedString(
                    String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.NO_CHEATING.ProTip2"),
                    tag: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.NO_CHEATING.ProTip2Tag")
                ),
                
                Challenge<String>.TaggedString(
                    String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.NO_CHEATING.ProTip3"),
                    tag: String(localized: "OUTFIT.MOUNTAINEER.ROUGHING_IT.NO_CHEATING.ProTip3Tag")
                ),
            ]
        )
    ]
}
