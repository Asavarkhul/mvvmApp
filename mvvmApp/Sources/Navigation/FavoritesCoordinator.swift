//
//  FavoriteCoordinator.swift
//  mvvmApp
//
//  Created by Bertrand BLOC'H on 07/12/2018.
//  Copyright © 2018 OPC. All rights reserved.
//

import UIKit

final class FavoritesCoordinator {

    // MARK: - Properties

    private let presenter: UINavigationController

    private let screens: Screens

    // MARK: - Initializer

    init(presenter: UINavigationController, screens: Screens) {
        self.presenter = presenter
        self.screens = screens
    }

    // MARK: - Coodinator
    
    func start() {
        showFavorites()
    }

    private func showFavorites() {
        let viewController = screens.createFavoritesViewController()
        presenter.viewControllers = [viewController]
    }
}
