//
//  Network.swift
//  mvvmApp
//
//  Created by Bertrand BLOC'H on 04/12/2018.
//  Copyright © 2018 OPC. All rights reserved.
//

import Foundation

protocol NetworkType: class {
    func getStuffs(success: @escaping (([Stuff]) -> Void), failure: @escaping (() -> Void))
}

final class Network: NetworkType {

    func getStuffs(success: @escaping (([Stuff]) -> Void), failure: @escaping (() -> Void)) {
        DispatchQueue.main.async {
            let result: [Stuff] = [
                Stuff(name: "Item1"),
                Stuff(name: "Item2"),
                Stuff(name: "Item3"),
                Stuff(name: "Item4")
            ]
            
            success(result)
        }
    }
}
