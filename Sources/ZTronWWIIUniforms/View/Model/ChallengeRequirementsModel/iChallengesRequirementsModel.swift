import Foundation

public protocol ChallengeRequirementsModel: Sendable {
    func getRequirements(_ token: String?) -> [Challenge<String>.TaggedString]
    func getDonts(_ token: String?) -> [Challenge<String>.TaggedString]
    func getBugs(_ token: String?) -> [Challenge<String>.TaggedString]
    func getProTips(_ token: String?) -> [Challenge<String>.TaggedString]
    func setToken(for tab: ChallengeTab, _ token: String)
    func removeTokens(for tab: ChallengeTab)
    func getActiveToken(for tab: ChallengeTab) -> String?
}
