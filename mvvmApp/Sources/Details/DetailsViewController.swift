//
//  DetailsViewController.swift
//  mvvmApp
//
//  Created by Bertrand BLOC'H on 26/10/2018.
//  Copyright © 2018 OPC. All rights reserved.
//

import UIKit

final class DetailsViewController: UIViewController {

    // MARK: - Properties

    var viewModel: DetailsViewModel!

    // MARK: - Outlets

    @IBOutlet private weak var detailsLabel: UILabel!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        bind(to: viewModel)

        viewModel.viewDidLoad()
    }

    private func bind(to viewModel: DetailsViewModel) {
        viewModel.titleText = { [weak self] text in
            self?.detailsLabel.text = text
        }
    }
}
