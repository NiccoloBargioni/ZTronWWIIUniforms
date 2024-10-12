import Foundation
import ZTronRouter

public func makeAllChallengesByMap() -> ZTronRouter<Empty, QuestsPositionMapper, Empty> {
    let router = ZTronRouter<Empty, QuestsPositionMapper, Empty>()

    router.register(
        QuestsPositionMapper(
            quests: makeGroestenHausQuests(),
            position: 0
        ),
        at: ["groesten haus"]
    )
    
    router.register(
        QuestsPositionMapper(
            quests: makeGroestenHausSurvivalQuests(),
            position: 0
        ),
        at: ["groesten haus", "sopravvivenza"]
    )
    
    router.register(
        QuestsPositionMapper(
            quests: makeGroestenHausPrologueQuests(),
            position: 0
        ),
        at: ["groesten haus", "prologo"]
    )
    
    router.register(
        QuestsPositionMapper(
            quests: makeTheFinalReichQuests(),
            position: 1
        ),
        at: ["the final reich"]
    )

    router.register(
        QuestsPositionMapper(
            quests: makeTheDarkestShoreQuests(),
            position: 2
        ),
        
        at: ["the darkest shore"]
    )

    router.register(
        QuestsPositionMapper(
            quests: makeTheShadowedThroneQuests(),
            position: 3
        ),
        at: ["the shadowed throne"]
    )

    router.register(
        QuestsPositionMapper(
            quests: makeTheTorturedPathQuests(),
            position: 4
        ),
        at: ["the tortured path"]
    )

    router.register(
        QuestsPositionMapper(
            quests: makeTheFrozenDawnQuests(),
            position:  5
        ),
        at: ["the frozen dawn"]
    )

    router.register(
        QuestsPositionMapper(
            quests: makeIntoTheStormQuests(),
            position: 0
        ),
        at: ["the tortured path", "into the storm"]
    )

    router.register(
        QuestsPositionMapper(
            quests: makeAcrossTheDepthsQuests(),
            position: 1
        ),
        at: ["the tortured path", "across the depths"]
    )

    router.register(
        QuestsPositionMapper(
            quests: makeBeneathTheIceQuests(),
            position: 2
        ),
        at: ["the tortured path", "beneath the ice"]
    )

    /*
    let DOT = router.toDOT { absolutePath, output in
        if let output = output {
            return output.first?.getMap() ?? absolutePath.last!
        } else {
            return absolutePath.last!
        }
    }

    print(DOT)
    */
    return router
}
