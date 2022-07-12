//
//  PersistenceManagerTestCase.swift
//  StocksAppCloneTests
//
//  Created by Vinojen Gengatharan on 2022-05-26.
//

import XCTest
@testable import StocksAppClone

class PersistenceManagerTestCase: XCTestCase {
    // properties
    var persistenceManagerHandler : PersistanceManager!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        persistenceManagerHandler = PersistanceManager.shared
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_AddSymbol()
    {
        let symbolToAdd = "APPL"
        persistenceManagerHandler.addToWatchList(symbolToAdd: symbolToAdd)
        let lastSymbolInWatchList = persistenceManagerHandler.watchList[persistenceManagerHandler.watchList.count - 1]
        XCTAssertEqual(symbolToAdd, lastSymbolInWatchList)
    }
    
    
    
    func test_RemoveFromWatchList()
    {
        let arrayToTest = ["APPL","MSFT","AMZN"]
        persistenceManagerHandler.watchList = arrayToTest
        persistenceManagerHandler.removeFromWatchList(symbolToRemoveString: "APPL")
        if(persistenceManagerHandler.watchList.contains("APPL"))
        {
            XCTFail()
        }
        else
        {
            // here this means that it does not contain the symbol so the test should pass
        }
    }
    
    func test_RemoveFromWatchList_whenWatchListHasOneItem()
    {
        let arrayToTest = ["APPL"]
        persistenceManagerHandler.watchList = arrayToTest
        persistenceManagerHandler.removeFromWatchList(symbolToRemoveString: "APPL")
        if(persistenceManagerHandler.watchList.contains("APPL"))
        {
            XCTFail("Deletion operation has failed with only one element")
        }
        else
        {
            // here this mean it does not contain the symbol and it should pass
        }
    }
}
