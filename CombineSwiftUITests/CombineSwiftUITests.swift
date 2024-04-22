//
//  CombineSwiftUITests.swift
//  CombineSwiftUITests
//
//  Created by asmaa gamal  on 22/04/2024.
//

import XCTest
@testable import CombineSwiftUI
import Combine
final class CombineSwiftUITests: XCTestCase {
var cancelabels = Set<AnyCancellable>()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cancelabels = []
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        var values: [Int] = []
        let myEvenPublisher = evenPublisher()
        let expectation = self.expectation(description:"All Completed")
        myEvenPublisher.sink {_ in
            expectation.fulfill()
        } receiveValue: { value in
            values.append(value)
        }.store(in: &cancelabels)
        waitForExpectations(timeout: 10)
        XCTAssert(values.allSatisfy({$0 % 2 == 0}))

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
