//
//  HomeViewController.swift
//  mvvmApp
//
//  Created by Bertrand BLOC'H on 19/10/2018.
//  Copyright © 2018 OPC. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Privates var

    private lazy var viewModel: HomeViewModel = {
        let repository = HomeRepository()
        let viewModel = HomeViewModel(repository: repository)
        return viewModel
    }()

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
