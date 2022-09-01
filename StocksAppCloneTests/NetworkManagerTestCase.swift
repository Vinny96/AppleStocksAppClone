//
//  NetworkManagerTestCase.swift
//  StocksAppCloneTests
//
//  Created by Vinojen Gengatharan on 2022-06-06.
//

import XCTest
@testable import StocksAppClone

class NetworkManagerTestCase: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Search()
    {
        let exp = self.expectation(description: "The search functionality has succeeded")
        let networkManager = NetworkManager.shared
        let stockSymbol = "Apple"
        
        defer {
            waitForExpectations(timeout: 5, handler: nil)
        }
        
        networkManager.search(query: stockSymbol) { searchResult in
            switch searchResult
            {
            case .success(let stockSearchResult):
                print(stockSearchResult.result)
                XCTAssertTrue(stockSearchResult.result.count != 0)
                exp.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
    }
    
   func test_GetTopStories()
    {
        let expectation = self.expectation(description: "The top stories functionality has succeeded")
        let networkManager = NetworkManager.shared
        defer {
            waitForExpectations(timeout: 5, handler: nil)
        }
        networkManager.getTopNews { result in
            switch result
            {
            case .success(let topNewsResultArray):
                XCTAssert(topNewsResultArray.isEmpty == false)
                expectation.fulfill()
            case .failure(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
    }
    

}
