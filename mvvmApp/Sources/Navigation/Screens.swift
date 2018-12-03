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

protocol HomeViewControllerDelegate: class {
    func homeScreenDidSelectDetail(with title: String)
}

extension Screens {

    func creatHomeViewController(repository: HomeRepository, delegate: HomeViewControllerDelegate?) -> UIViewController {
        let viewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let viewModel = HomeViewModel(repository: repository, delegate: delegate)
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
