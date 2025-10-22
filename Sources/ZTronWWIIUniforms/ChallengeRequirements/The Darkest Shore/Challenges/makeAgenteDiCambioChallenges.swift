import Foundation



internal func makeAgenteDiCambioChallenges() -> [Challenge<String>] {
    return [
        Challenge<String>(
            name: "OUTFIT.THE_HUNTER_FROM_SEVILLE.STOCK_BROKER.CHA-CHING!.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.THE_HUNTER_FROM_SEVILLE.STOCK_BROKER.CHA-CHING!.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.THE_HUNTER_FROM_SEVILLE.STOCK_BROKER.CHA-CHING!.Requirement1".fromLocalized(),
                    tag: "OUTFIT.THE_HUNTER_FROM_SEVILLE.STOCK_BROKER.CHA-CHING!.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: []
        ),
        
        Challenge<String>(
            name: "OUTFIT.THE_HUNTER_FROM_SEVILLE.STOCK_BROKER.ROLLING_IN_IT.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.THE_HUNTER_FROM_SEVILLE.STOCK_BROKER.ROLLING_IN_IT.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.THE_HUNTER_FROM_SEVILLE.STOCK_BROKER.ROLLING_IN_IT.Requirement1".fromLocalized(),
                    tag: "OUTFIT.THE_HUNTER_FROM_SEVILLE.STOCK_BROKER.ROLLING_IN_IT.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: []
        ),
        
        Challenge<String>(
            name: "OUTFIT.THE_HUNTER_FROM_SEVILLE.STOCK_BROKER.SAVINGS_ACCOUNT.ChallengeName".fromLocalized(),
            map: "the darkest shore",
            riddle: "OUTFIT.THE_HUNTER_FROM_SEVILLE.STOCK_BROKER.SAVINGS_ACCOUNT.Riddle".fromLocalized(),
            requirements: [
                Challenge<String>.TaggedString(
                    "OUTFIT.THE_HUNTER_FROM_SEVILLE.STOCK_BROKER.SAVINGS_ACCOUNT.Requirement1".fromLocalized(),
                    tag: "OUTFIT.THE_HUNTER_FROM_SEVILLE.STOCK_BROKER.SAVINGS_ACCOUNT.Requirement1Tag".fromLocalized()
                )
            ],
            donts: [],
            glitches: [],
            proTips: []
        )

    ]
}
