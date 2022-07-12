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
        let networkManager = NetworkManager.shared
        let stockSymbol = "Apple"
        networkManager.search(query: stockSymbol) { searchResult in
            switch searchResult
            {
            case .success(let stockSearchResult):
                XCTAssertTrue(stockSearchResult.result.count != 0)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
    }
    
    // MARK: - MAking URL Code
    

}
