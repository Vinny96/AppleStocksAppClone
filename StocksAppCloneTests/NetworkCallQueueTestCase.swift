//
//  NetworkCallQueueTestCase.swift
//  StocksAppCloneTests
//
//  Created by Vinojen Gengatharan on 2022-07-16.
//

import XCTest
@testable import StocksAppClone

class NetworkCallQueueTestCase: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_NetworkCallQueue_WithOneDataTask()
    {
        let dummyURL = URL(string: "DUMMY")!
        let fakeTask = URLSession.shared.dataTask(with: dummyURL)
        NetworkCallQueue.shared.addDataTask(dataTask: fakeTask)
        let peekResult = NetworkCallQueue.shared.peek()
        if(peekResult == false)
        {
            XCTFail("The dataTask did not get added properly to the networkCallQueue")
        }
        
    }
    
    func test_NetworkCallQueue_WithTwoDataTask()
    {
        let dummyURL = URL(string: "DUMMY")!
        let fakeTaskOne = URLSession.shared.dataTask(with: dummyURL)
        let fakeTaskTwo = URLSession.shared.dataTask(with: dummyURL)
        NetworkCallQueue.shared.addDataTask(dataTask: fakeTaskOne)
        NetworkCallQueue.shared.addDataTask(dataTask: fakeTaskTwo)
        
        let peekResult = NetworkCallQueue.shared.peek()
        if(peekResult == false)
        {
            XCTFail()
        }
        
    }

}
