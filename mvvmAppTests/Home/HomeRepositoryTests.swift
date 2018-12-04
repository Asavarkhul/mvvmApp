//
//  HomeRepositoryTests.swift
//  mvvmAppTests
//
//  Created by Bertrand BLOC'H on 04/12/2018.
//  Copyright © 2018 OPC. All rights reserved.
//

import XCTest
@testable import mvvmApp

final class HomeRepositoryTests: XCTestCase {

    func testGivenAHomeRepository_WhenRequestStuffs_ResultIsCorrectlyReturned() {
        let repository = HomeRepository()
        let expectation = self.expectation(description: "Returned Stuffs")

        let expectedResult: [Stuff] = [
            Stuff(name: "Item1"),
            Stuff(name: "Item2"),
            Stuff(name: "Item3"),
            Stuff(name: "Item4")
        ]

        repository.requestStuffs(callBack: { stuffs in
            XCTAssertEqual(stuffs, expectedResult)
            expectation.fulfill()
        })

        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
