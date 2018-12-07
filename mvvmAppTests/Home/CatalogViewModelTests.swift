//
//  CatalogViewModelTests.swift
//  mvvmAppTests
//
//  Created by Bertrand BLOC'H on 09/11/2018.
//  Copyright © 2018 OPC. All rights reserved.
//

import XCTest
@testable import mvvmApp

final class CatalogViewModelTests: XCTestCase {

    func testGivenAHomeViewModel_WhenViewDidLoad_ThenItemsAreCorrectlyReturned() {
        let repository = MockCatalogRepository()
        repository.stuffs = [
            Stuff(name: "Item1"),
            Stuff(name: "Item2"),
            Stuff(name: "Item3")
        ]
        let viewModel = CatalogViewModel(repository: repository, delegate: nil)
        let expectation = self.expectation(description: "Returned Items")
        let expectedResult: [CatalogViewModel.Item] = [
            .stuff(name: "Item1"),
            .stuff(name: "Item2"),
            .stuff(name: "Item3")
        ]

        viewModel.visibleItems = { items in
            XCTAssertEqual(items, expectedResult)
            expectation.fulfill()
        }

        viewModel.viewDidLoad()

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenAHomeViewModelWith3ItemsReturnedByRepository_WhenDidSelectItemAt1_ThenDelegateIsCorrectlySent() {
        let repository = MockCatalogRepository()
        repository.stuffs = [
            Stuff(name: "Item1"),
            Stuff(name: "Item2"),
            Stuff(name: "Item3")
        ]
        let delegate = MockCatalogViewControllerDelegate()
        let viewModel = CatalogViewModel(repository: repository, delegate: delegate)

        viewModel.viewDidLoad()

        viewModel.didSelectItem(at: 1)

        XCTAssertEqual(delegate.title, "Item2")
    }

    func testGivenAHomeViewModelWith3ItemsReturnedByRepository_WhenDidSelectItemAt6_ThenDelegateIsNotSent() {
        let repository = MockCatalogRepository()
        repository.stuffs = [
            Stuff(name: "Item1"),
            Stuff(name: "Item2"),
            Stuff(name: "Item3")
        ]
        let delegate = MockCatalogViewControllerDelegate()
        let viewModel = CatalogViewModel(repository: repository, delegate: delegate)

        viewModel.viewDidLoad()

        viewModel.didSelectItem(at: 6)

        XCTAssertEqual(delegate.title, "")
    }
}

fileprivate final class MockCatalogRepository: CatalogRepositoryType {

    var stuffs: [Stuff] = []

    func requestStuffs(callBack: @escaping ([Stuff]) -> Void, failure: @escaping (() -> Void)) {
        callBack(stuffs)
    }
}

fileprivate final class MockCatalogViewControllerDelegate: CatalogViewControllerDelegate {

    var title = ""
    
    func catalogScreenDidSelectDetail(with title: String) {
        self.title = title
    }
}
