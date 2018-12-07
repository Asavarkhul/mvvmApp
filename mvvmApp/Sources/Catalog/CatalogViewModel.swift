//
//  CatalogViewModel.swift
//  mvvmApp
//
//  Created by Bertrand BLOC'H on 19/10/2018.
//  Copyright © 2018 OPC. All rights reserved.
//

import Foundation

struct StuffItem: Equatable {
    let name: String
}

final class CatalogViewModel {

    // MARK: Private properties

    private let repository: CatalogRepositoryType

    private weak var delegate: CatalogViewControllerDelegate?

    private var courseItems: [CourseItem] = [] {
        didSet {
            let items = courseItems.map { Item(courseItem: $0) }
            visibleItems?(items)
        }
    }

    // MARK: - Initializer

    init(repository: CatalogRepositoryType, delegate: CatalogViewControllerDelegate?) {
        self.repository = repository
        self.delegate = delegate
    }

    // MARK: - Properties

    enum Item: Equatable {
        case stuff(name: String)
    }

    fileprivate enum CourseItem: Equatable {
        case stuff(stuffItem: StuffItem)
    }

    // MARK: - Outputs

    var visibleItems: (([Item]) -> Void)?

    var titleText: ((String) -> Void)?

    // MARK: - Inputs

    func viewDidLoad() {
        titleText?("Catalog")

        repository.requestStuffs(callBack: { [weak self] stuffs in
                self?.courseItems = CatalogViewModel.initialItems(from: stuffs)
            }, failure: {
                // FIXME: - Asks the coordinator to present an Alert 🚨
            })
    }

    func didSelectItem(at index: Int) {
        guard self.courseItems.count > index else {
            return
        }
        
        let courseItem = self.courseItems[index]
        if case .stuff(stuffItem: let stuffItem) = courseItem {
            self.delegate?.catalogScreenDidSelectDetail(with: stuffItem.name)
        }
    }

    // MARK: - Utils

    private class func initialItems(from stuffs: [Stuff]) -> [CourseItem] {
        return stuffs.map {
            return .stuff(stuffItem: StuffItem(name: $0.name))
        }
    }
}

// MARK: - Extension

extension CatalogViewModel.Item {
    fileprivate init(courseItem: CatalogViewModel.CourseItem) {
        switch courseItem {
        case .stuff(stuffItem: let stuffItem):
            self = .stuff(name: stuffItem.name)
        }
    }
}

