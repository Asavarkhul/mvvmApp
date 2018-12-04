//
//  HomeViewModel.swift
//  mvvmApp
//
//  Created by Bertrand BLOC'H on 19/10/2018.
//  Copyright © 2018 OPC. All rights reserved.
//

import Foundation

struct StuffItem: Equatable {
    let name: String
}

final class HomeViewModel {

    // MARK: Private properties

    private let repository: HomeRepositoryType

    private weak var delegate: HomeViewControllerDelegate?

    private var courseItems: [CourseItem] = [] {
        didSet {
            let items = courseItems.map { Item(courseItem: $0) }
            visibleItems?(items)
        }
    }

    // MARK: - Initializer

    init(repository: HomeRepositoryType, delegate: HomeViewControllerDelegate?) {
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

    // MARK: - Inputs

    func viewDidLoad() {
        repository.requestStuffs(callBack: { [weak self] stuffs in
                self?.courseItems = HomeViewModel.initialItems(from: stuffs)
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
            self.delegate?.homeScreenDidSelectDetail(with: stuffItem.name)
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

extension HomeViewModel.Item {
    fileprivate init(courseItem: HomeViewModel.CourseItem) {
        switch courseItem {
        case .stuff(stuffItem: let stuffItem):
            self = .stuff(name: stuffItem.name)
        }
    }
}

