//
//  Screens.swift
//  mvvmApp
//
//  Created by Bertrand BLOC'H on 26/10/2018.
//  Copyright © 2018 OPC. All rights reserved.
//

import UIKit

public class Screens {

    // MARK: - Properties

    let storyBoard = UIStoryboard(name: "Main", bundle: Bundle(for: Screens.self))
}

// MARK: - Home

protocol CatalogViewControllerDelegate: class {
    func catalogScreenDidSelectDetail(with title: String)
}

extension Screens {

    func creatCatalogViewController(repository: CatalogRepository, delegate: CatalogViewControllerDelegate?) -> UIViewController {
        let viewController = storyBoard.instantiateViewController(withIdentifier: "CatalogViewController") as! CatalogViewController
        let viewModel = CatalogViewModel(repository: repository, delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }
}

extension Screens {

    func createDetailsViewController(title: String) -> UIViewController {
        let viewController = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        let viewModel = DetailsViewModel(title: title)
        viewController.viewModel = viewModel
        return viewController
    }
}

extension Screens {

    func createFavoritesViewController() -> UIViewController {
        let viewController = storyBoard.instantiateViewController(withIdentifier: "FavoritesViewController") as! FavoritesViewController
        return viewController
    }
}
