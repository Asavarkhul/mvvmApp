//
//  CatalogRepository.swift
//  mvvmApp
//
//  Created by Bertrand BLOC'H on 19/10/2018.
//  Copyright © 2018 OPC. All rights reserved.
//

import Foundation

protocol CatalogRepositoryType: class {
    func requestStuffs(callBack: @escaping ([Stuff]) -> Void, failure: @escaping (() -> Void))
}

final class CatalogRepository: CatalogRepositoryType {

    private let network: NetworkType

    init(network: NetworkType) {
        self.network = network
    }

    func requestStuffs(callBack: @escaping ([Stuff]) -> Void, failure: @escaping (() -> Void)) {
        network.getStuffs(success: callBack, failure: failure)
    }
}
