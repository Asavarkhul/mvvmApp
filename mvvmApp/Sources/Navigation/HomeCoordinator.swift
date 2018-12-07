//
//  HomeCoordinator.swift
//  mvvmApp
//
//  Created by Bertrand BLOC'H on 07/12/2018.
//  Copyright © 2018 OPC. All rights reserved.
//

import UIKit

enum ViewControllerItem: Int {
    case catalog = 0
    case favorite
}

protocol TabBarSourceType {
    var items: [UINavigationController] { get set }
}


extension TabBarSourceType {
    subscript(item: ViewControllerItem) -> UINavigationController {
        get {
            guard !items.isEmpty, item.rawValue < items.count, item.rawValue >= 0 else {
                fatalError("Item does not exists")
            }
            return items[item.rawValue]
        }
    }
}

fileprivate class TabBarSource: TabBarSourceType {
    var items: [UINavigationController] = [
        UINavigationController(nibName: nil, bundle: nil),
        UINavigationController(nibName: nil, bundle: nil)
    ]

    init() {
        self[.catalog].tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        self[.favorite].tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
    }
}

final class HomeCoordinator: NSObject, UITabBarControllerDelegate {

    // MARK: - Properties
    
    private let presenter: UIWindow

    private let tabBarController: UITabBarController

    private let screens: Screens

    private var catalogCoordinator: CatalogCoordinator?

    private var favoritesCoordinator: FavoritesCoordinator?

    private var tabBarSource: TabBarSourceType = TabBarSource()

    // MARK: - Init

    init(presenter: UIWindow) {
        self.presenter = presenter

        screens = Screens()

        tabBarController = UITabBarController(nibName: nil, bundle: nil)
        tabBarController.viewControllers = tabBarSource.items
        tabBarController.selectedViewController = tabBarSource[.catalog]

        super.init()

        tabBarController.delegate = self
    }

    // MARK: - Coordinator

    func start() {
        presenter.rootViewController = tabBarController
        showCatalog()
    }

    private func showCatalog() {
        catalogCoordinator = CatalogCoordinator(presenter: tabBarSource[.catalog], screens: screens)
        catalogCoordinator?.start()
    }

    private func showFavorites() {
        favoritesCoordinator = FavoritesCoordinator(presenter: tabBarSource[.favorite], screens: screens)
        favoritesCoordinator?.start()
    }
}

extension HomeCoordinator {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let index = tabBarController.selectedIndex
        guard index < tabBarSource.items.count, let item = ViewControllerItem(rawValue: index) else {
            fatalError("Selected ViewController Index Out Of range")
        }

        switch item {
        case .catalog:
            showCatalog()
        case .favorite:
            showFavorites()
        }
    }
}

