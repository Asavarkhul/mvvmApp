//
//  CatalogCoordinator.swift
//  mvvmApp
//
//  Created by Bertrand BLOC'H on 26/10/2018.
//  Copyright © 2018 OPC. All rights reserved.
//

import UIKit

final class CatalogCoordinator {

    // MARK: - Properties

    private let presenter: UINavigationController

    private let screens: Screens

    private let network: NetworkType
    
    // MARK: - Initializer

    init(presenter: UINavigationController, screens: Screens, network: NetworkType = Network()) {
        self.presenter = presenter
        self.screens = screens
        self.network = network
    }
    
    // MARK: - Coodinator

    func start() {
        showHome()
    }

    private func showHome() {
        let repository = CatalogRepository(network: network)
        let viewController = screens.creatCatalogViewController(repository: repository, delegate: self)
        presenter.viewControllers = [viewController]
    }

    private func showDetails(for title: String) {
        let viewController = screens.createDetailsViewController(title: title)
        presenter.show(viewController, sender: nil)
    }
}

extension CatalogCoordinator: CatalogViewControllerDelegate {
    func catalogScreenDidSelectDetail(with title: String) {
        showDetails(for: title)
    }
}
