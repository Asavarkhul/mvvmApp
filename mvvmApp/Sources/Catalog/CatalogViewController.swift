//
//  CatalogViewController.swift
//  mvvmApp
//
//  Created by Bertrand BLOC'H on 19/10/2018.
//  Copyright © 2018 OPC. All rights reserved.
//

import UIKit

final class CatalogViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Privates var

    var viewModel: CatalogViewModel!

    private let dataSource = CatalogViewControllerDataSource()

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        tableView.delegate = dataSource

        bind(to: dataSource)
        bind(to: viewModel)

        viewModel.viewDidLoad()
    }

    private func bind(to source: CatalogViewControllerDataSource) {
        source.didSelectItemAtIndex = viewModel.didSelectItem
    }

    private func bind(to: CatalogViewModel) {
        viewModel.visibleItems = { [weak self] items in
            self?.dataSource.update(with: items)
            self?.tableView.reloadData()
        }
    }
}
