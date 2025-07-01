import Foundation
import Combine
import os

public final class ChallengeRequirementsModelProxy: ChallengeRequirementsModel, ObservableObject, @unchecked Sendable {
    
    weak private var quest: Quest?
    weak private var challenge: Challenge<String>?
    
    private var concreteModel: ConcreteChallengeRequirementsModel?
    private var subscription: AnyCancellable?
    private let logger = Logger(subsystem: "com.zombietron.outfits", category: "ChallengeRequirementsModelProxy")
    
    private let questLock = DispatchSemaphore(value: 1)
    private let challengeLock = DispatchSemaphore(value: 1)
    private let concreteModelLock = DispatchSemaphore(value: 1)
    private let subscriptionLock = DispatchSemaphore(value: 1)
    
    public init() {

    }
    
    public func setQuest(_ quest: Quest) {
        self.questLock.wait()
        
        defer {
            self.questLock.signal()
        }
        
        self.quest = quest
        
        self.challengeLock.wait()
        
        defer {
            self.challengeLock.signal()
        }
        
        if self.challenge != nil {
            self.concreteModelLock.wait()
            self.subscriptionLock.wait()
            self.instantiateIfPossibleAndNeeded()
            self.subscriptionLock.signal()
            self.concreteModelLock.signal()
        }
    }
    
    func setChallenge(_ challenge: Challenge<String>) {
        self.challengeLock.wait()
        self.challenge = challenge
        
        defer {
            self.challengeLock.signal()
        }
        
        self.questLock.wait()
        
        defer {
            self.questLock.signal()
        }
        
        if self.quest != nil {
            self.concreteModelLock.wait()
            self.subscriptionLock.wait()
            self.instantiateIfPossibleAndNeeded()
            self.subscriptionLock.signal()
            self.concreteModelLock.signal()
        }
        
    }
    
    public func getRequirements(_ token: String? = nil) -> [Challenge<String>.TaggedString] {
        self.questLock.wait()
        self.challengeLock.wait()
        self.concreteModelLock.wait()
        self.subscriptionLock.wait()
        self.instantiateIfPossibleAndNeeded()
        self.subscriptionLock.signal()
        self.challengeLock.signal()
        self.questLock.signal()
        
        defer {
            self.concreteModelLock.signal()
        }
        
        return self.concreteModel?.getRequirements(token) ?? []
    }
    
    public func getDonts(_ token: String? = nil) -> [Challenge<String>.TaggedString] {
        self.questLock.wait()
        self.challengeLock.wait()
        self.concreteModelLock.wait()
        self.subscriptionLock.wait()
        self.instantiateIfPossibleAndNeeded()
        self.subscriptionLock.signal()
        self.challengeLock.signal()
        self.questLock.signal()
        
        defer {
            self.concreteModelLock.signal()
        }

        
        return self.concreteModel?.getDonts(token) ?? []
    }
    
    public func getBugs(_ token: String? = nil) -> [Challenge<String>.TaggedString] {
        self.questLock.wait()
        self.challengeLock.wait()
        self.concreteModelLock.wait()
        self.subscriptionLock.wait()
        self.instantiateIfPossibleAndNeeded()
        self.subscriptionLock.signal()
        self.challengeLock.signal()
        self.questLock.signal()
        
        defer {
            self.concreteModelLock.signal()
        }

        
        return self.concreteModel?.getBugs(token) ?? []
    }
    
    public func getProTips(_ token: String? = nil) -> [Challenge<String>.TaggedString] {
        self.questLock.wait()
        self.challengeLock.wait()
        self.concreteModelLock.wait()
        self.subscriptionLock.wait()
        self.instantiateIfPossibleAndNeeded()
        self.subscriptionLock.signal()
        self.challengeLock.signal()
        self.questLock.signal()
        
        defer {
            self.concreteModelLock.signal()
        }
        
        return self.concreteModel?.getProTips(token) ?? []
    }
    
    public func setToken(for tab: ChallengeTab, _ token: String) {
        self.questLock.wait()
        self.challengeLock.wait()
        self.concreteModelLock.wait()
        self.subscriptionLock.wait()
        self.instantiateIfPossibleAndNeeded()
        self.subscriptionLock.signal()
        self.challengeLock.signal()
        self.questLock.signal()
        
        defer {
            self.concreteModelLock.signal()
        }
        
        self.concreteModel?.setToken(for: tab, token)
    }
    
    public func removeTokens(for tab: ChallengeTab) {
        self.questLock.wait()
        self.challengeLock.wait()
        self.concreteModelLock.wait()
        self.subscriptionLock.wait()
        self.instantiateIfPossibleAndNeeded()
        self.subscriptionLock.signal()
        self.challengeLock.signal()
        self.questLock.signal()
        
        defer {
            self.concreteModelLock.signal()
        }

        
        self.concreteModel?.removeTokens(for: tab)
    }
    
    public func getActiveToken(for tab: ChallengeTab) -> String? {
        self.questLock.wait()
        self.challengeLock.wait()
        self.concreteModelLock.wait()
        self.subscriptionLock.wait()
        self.instantiateIfPossibleAndNeeded()
        self.subscriptionLock.signal()
        self.challengeLock.signal()
        self.questLock.signal()
        
        defer {
            self.concreteModelLock.signal()
        }


        return self.concreteModel?.getActiveToken(for: tab)
    }
    
    public func didInstantiate() -> Bool {
        self.concreteModelLock.wait()
        
        defer {
            self.concreteModelLock.signal()
        }
        
        return self.concreteModel != nil
    }
    
    private func instantiateIfPossibleAndNeeded() {
        guard self.concreteModel == nil else { return }
        
        guard let quest = self.quest, let challenge = self.challenge else {
            #if DEBUG
            self.logger.debug("Attempted to instantiate concrete ChallengeRequirementsModel before adding a quest or challenge. Aborting.")
            return
            #else
            return
            #endif
        }
        
        self.concreteModel = ConcreteChallengeRequirementsModel(quest: quest, challenge: challenge)
        self.subscription = self.concreteModel!.objectWillChange.sink { _ in
            self.objectWillChange.send()
        }
        
        self.objectWillChange.send()
    }
    
    
    deinit {
        self.subscriptionLock.wait()
        self.subscription?.cancel()
        self.subscriptionLock.signal()
    }
    
}
