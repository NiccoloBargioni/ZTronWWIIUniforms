import Foundation

public final class ConcreteChallengeRequirementsModel: ChallengeRequirementsModel, ObservableObject, @unchecked Sendable {
    
    private let quest: Quest
    private let challenge: Challenge<String>
    @Published private var activeSearchTokens: [ChallengeTab: String] = [:]
    
    private let activeSearchTokensLock = DispatchSemaphore(value: 1)
    
    public init(quest: Quest, challenge: Challenge<String>) {
        self.quest = quest
        self.challenge = challenge
    }
    
    
    public func getRequirements(_ token: String? = nil) -> [Challenge<String>.TaggedString] {
        if let token = token {
            return challenge.getRequirements().filter { requirement in
                let i18nRequirementTag = String(localized: String.LocalizationValue(stringLiteral: requirement.getTag()), bundle: StringsBundle.bundle)
                return i18nRequirementTag == token
            }
        } else {
            self.activeSearchTokensLock.wait()
            
            defer {
                self.activeSearchTokensLock.signal()
            }
                    
            if let token = self.activeSearchTokens[.requirements] {
                return self.getRequirements(token)
            } else {
                return challenge.getRequirements()
            }
        }
    }
    
    public func getDonts(_ token: String? = nil) -> [Challenge<String>.TaggedString] {
        if let token = token {
            return challenge.getDonts().filter { dont in
                let i18nDontTag = String(localized: String.LocalizationValue(stringLiteral: dont.getTag()), bundle: StringsBundle.bundle)

                return i18nDontTag == token
            }
        } else {
            
            self.activeSearchTokensLock.wait()
            
            defer {
                self.activeSearchTokensLock.signal()
            }
            
            if let token = self.activeSearchTokens[.donts] {
                return self.getDonts(token)
            } else {
                return challenge.getDonts()
            }
        }
    }
    
    public func getBugs(_ token: String? = nil) -> [Challenge<String>.TaggedString] {
        if let token = token {
            return self.challenge.getGlitches().filter { glitch in
                let i18nGlitchTag = String(localized: String.LocalizationValue(stringLiteral: glitch.getTag()), bundle: StringsBundle.bundle)

                return i18nGlitchTag == token
            }
        } else {
            self.activeSearchTokensLock.wait()
            
            defer {
                self.activeSearchTokensLock.signal()
            }
            
            if let token = self.activeSearchTokens[.bugs] {
                return self.getBugs(token)
            } else {
                return self.challenge.getGlitches()
            }
        }
    }
    
    public func getProTips(_ token: String? = nil) -> [Challenge<String>.TaggedString] {
        if let token = token {
            return self.challenge.getProTips().filter { proTip in
                let i18nProTipTag = String(localized: String.LocalizationValue(stringLiteral: proTip.getTag()), bundle: StringsBundle.bundle)

                return i18nProTipTag == token
            }
        } else {
            self.activeSearchTokensLock.wait()
            
            defer {
                self.activeSearchTokensLock.signal()
            }
            
            if let token = self.activeSearchTokens[.proTips] {
                return self.getProTips(token)
            } else {
                return self.challenge.getProTips()
            }
        }
    }
    
    public func setToken(for tab: ChallengeTab, _ token: String) {
        self.activeSearchTokensLock.wait()
        
        defer {
            self.activeSearchTokensLock.signal()
        }
        
        self.activeSearchTokens[tab] = token
    }
    
    public func removeTokens(for tab: ChallengeTab) {
        self.activeSearchTokensLock.wait()
        
        defer {
            self.activeSearchTokensLock.signal()
        }
        
        self.activeSearchTokens[tab] = nil
    }
    
    public func getActiveToken(for tab: ChallengeTab) -> String? {
        self.activeSearchTokensLock.wait()
        
        defer {
            self.activeSearchTokensLock.signal()
        }
        
        return self.activeSearchTokens[tab]
    }
}
