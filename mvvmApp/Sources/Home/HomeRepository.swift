//
//  HomeRepository.swift
//  mvvmApp
//
//  Created by Bertrand BLOC'H on 19/10/2018.
//  Copyright © 2018 OPC. All rights reserved.
//

import Foundation

final class HomeRepository {
    
    func requestStuffs(callBack: @escaping ([Stuff]) -> Void) {
        DispatchQueue.main.async {
            let result: [Stuff] = [
                Stuff(name: "Item1"),
                Stuff(name: "Item2"),
                Stuff(name: "Item3"),
                Stuff(name: "Item4")
            ]

            callBack(result)
        }
    }
}
