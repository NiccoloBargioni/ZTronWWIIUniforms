import XCTest
import ZTronWWIIUniforms

final class UniformsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testChallengesModel() throws {
        XCTAssertNotNil(QuestModel(routes: makeAllChallengesByMap()))
        
        let frozenDawn = QuestModel(
            routes: makeAllChallengesByMap(),
            withInitialChips: [
                [">", "the frozen dawn"]
            ]
        )
        
        XCTAssertNotNil(frozenDawn)
        XCTAssertEqual(frozenDawn?.lastVisibleLevel(), 0)
        
        frozenDawn?.unselectChip([">", "the tortured path"])
        XCTAssertEqual(frozenDawn?.lastVisibleLevel(), 0)
        XCTAssertEqual(frozenDawn?.getSelectedChips().first!.count, 1)

        frozenDawn?.unselectChip([">", "the frozen dawn"])
        XCTAssertEqual(frozenDawn?.lastVisibleLevel(), 0)
        XCTAssertEqual(frozenDawn?.getSelectedChips().first!.count, 1)
        
        
        let torturedPath = QuestModel(
            routes: makeAllChallengesByMap(),
            withInitialChips: [
                [">", "the tortured path"],
                [">", "the tortured path", "beneath the ice"],
                [">", "the tortured path", "across the depths"],
                [">", "the tortured path", "into the storm"]
            ]
        )
                
        XCTAssertNotNil(torturedPath)
        XCTAssertEqual(torturedPath?.lastVisibleLevel(), 1)
        
        torturedPath?.unselectChip([">", "the frozen dawn"])
        
        XCTAssertEqual(torturedPath?.lastVisibleLevel(), 1)
        XCTAssertEqual(torturedPath?.getSelectedChips().first?.count, 1)
        XCTAssertEqual(torturedPath?.getSelectedChips()[1].count, 3)

        torturedPath?.unselectChip([">", "the tortured path", "across the depths"])
        XCTAssertEqual(torturedPath?.lastVisibleLevel(), 1)
        XCTAssertEqual(torturedPath?.getSelectedChips().first?.count, 1)
        XCTAssertEqual(torturedPath?.getSelectedChips()[1].count, 2)
        
        torturedPath?.unselectChip([">", "the tortured path", "beneath the ice"])
        XCTAssertEqual(torturedPath?.lastVisibleLevel(), 1)
        XCTAssertEqual(torturedPath?.getSelectedChips().first?.count, 1)
        XCTAssertEqual(torturedPath?.getSelectedChips()[1].count, 1)
        
        torturedPath?.unselectChip([">", "the tortured path", "into the storm"])
        XCTAssertEqual(torturedPath?.lastVisibleLevel(), 1)
        XCTAssertEqual(torturedPath?.getSelectedChips().first?.count, 1)
        XCTAssertEqual(torturedPath?.getSelectedChips()[1].count, 1)
        
        torturedPath?.selectChip([">", "the shadowed throne"])
        XCTAssertEqual(torturedPath?.lastVisibleLevel(), 0)
        XCTAssertEqual(torturedPath?.getSelectedChips().first?.count, 1)
        
        XCTAssertNil(
            QuestModel(
                routes: makeAllChallengesByMap(),
                withInitialChips: [
                    [">", "cosmic way"]
                ]
            )
        )
        
        let invalidModel = QuestModel(
            routes: makeAllChallengesByMap(),
            withInitialChips: [
                [">", "the frozen dawn"],
                [">", "the tortured path", "beneath the ice"],
                [">", "the tortured path", "across the depths"],
                [">", "the tortured path", "into the storm"]
            ]
        )
                
        XCTAssertNil(invalidModel)
    }
    
    func testSwipeManager() throws {
        var swipeManager = ChallengeRequirementsSwipeManager(challengesCount: 1, initialChallenge: 0)
        var viewStack = swipeManager.getChallengesStack()
        
        XCTAssertEqual(viewStack[0].getWrappedValue(), 0)
        XCTAssertEqual(viewStack[0].getPosition(), 0)
        
        swipeManager = ChallengeRequirementsSwipeManager(challengesCount: 10, initialChallenge: 9)
        viewStack = swipeManager.getChallengesStack()
        
        XCTAssertEqual(viewStack[0].getWrappedValue(), 8)
        XCTAssertEqual(viewStack[0].getPosition(), 0)
        
        XCTAssertEqual(viewStack[1].getWrappedValue(), 9)
        XCTAssertEqual(viewStack[1].getPosition(), 1)

        swipeManager = ChallengeRequirementsSwipeManager(challengesCount: 10, initialChallenge: 0)
        viewStack = swipeManager.getChallengesStack()
        
        XCTAssertEqual(viewStack[0].getWrappedValue(), 9)
        XCTAssertEqual(viewStack[0].getPosition(), 0)
        
        XCTAssertEqual(viewStack[1].getWrappedValue(), 0)
        XCTAssertEqual(viewStack[1].getPosition(), 1)

        XCTAssertEqual(swipeManager.getCurrentVisibleChallenge(), 0)
        
        swipeManager.prepareForNext()
        swipeManager.swapOnscreenBuffer()
        
        viewStack = swipeManager.getChallengesStack()
        
        XCTAssertEqual(viewStack[0].getWrappedValue(), 0)
        XCTAssertEqual(viewStack[0].getPosition(), 0)
        
        XCTAssertEqual(viewStack[1].getWrappedValue(), 1)
        XCTAssertEqual(viewStack[1].getPosition(), 1)
        
        swipeManager.prepareForNext(forward: false)
        swipeManager.prepareForNext(forward: false)
        swipeManager.swapOnscreenBuffer()
        
        viewStack = swipeManager.getChallengesStack()

        XCTAssertEqual(viewStack[0].getWrappedValue(), 0)
        XCTAssertEqual(viewStack[0].getPosition(), 0)
        
        XCTAssertEqual(viewStack[1].getWrappedValue(), 9)
        XCTAssertEqual(viewStack[1].getPosition(), 1)

    }

}
