//
//  HomeViewModel.swift
//  mvvmApp
//
//  Created by Bertrand BLOC'H on 19/10/2018.
//  Copyright © 2018 OPC. All rights reserved.
//

import Foundation

struct StuffItem {
    let name: String
}

final class HomeViewModel {

    // MARK: Private properties

    private let repository: HomeRepository

    private var coursItems: [CourseItem] = [] {
        didSet {
            let items = coursItems.map { Item(coursItem: $0) }
            visibleItems?(items)
        }
    }

    // MARK: - Initilizer

    init(repository: HomeRepository) {
        self.repository = repository
    }

    // MARK: - Properties

    enum Item {
        case stuff(name: String)
    }

    fileprivate enum CourseItem {
        case stuff(stuffItem: StuffItem)
    }

    // MARK: - Outputs

    var visibleItems: (([Item]) -> Void)?

    // MARK: - Inputs

    func viewDidLoad() {
        repository.requestStuffs { [weak self] stuffs in
            self?.coursItems = HomeViewModel.initialItems(from: stuffs)
        }
    }

    private class func initialItems(from stuffs: [Stuff]) -> [CourseItem] {
        return stuffs.map {
            return .stuff(stuffItem: StuffItem(name: $0.name))
        }
    }
}

// MARK: - Extension

extension HomeViewModel.Item {
    fileprivate init(coursItem: HomeViewModel.CourseItem) {
        switch coursItem {
        case .stuff(stuffItem: let stuffItem):
            self = .stuff(name: stuffItem.name)
        }
    }
}

