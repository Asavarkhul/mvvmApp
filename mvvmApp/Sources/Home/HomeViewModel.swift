//
//  HomeViewModel.swift
//  mvvmApp
//
//  Created by Bertrand BLOC'H on 19/10/2018.
//  Copyright © 2018 OPC. All rights reserved.
//

import Foundation

final class HomeViewModel {

    // MARK: Private properties

    private let repository: HomeRepository

    // MARK: - Initilizer

    init(repository: HomeRepository) {
        self.repository = repository
    }
}
