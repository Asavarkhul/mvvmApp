//
//  DetailsViewModel.swift
//  mvvmApp
//
//  Created by Bertrand BLOC'H on 26/10/2018.
//  Copyright © 2018 OPC. All rights reserved.
//

import Foundation

final class DetailsViewModel {

    // MARK: Private properties

    private let title: String
    
    // MARK: - Initilizer
    
    init(title: String) {
        self.title = title
    }

    // MARK: - Outputs

    var titleText: ((String) -> Void)?

    // MARK: - Inputs

    func viewDidLoad() {
        titleText?(title)
    }
}
