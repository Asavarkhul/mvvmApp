//
//  CatalogViewControllerDataSource.swift
//  mvvmApp
//
//  Created by Bertrand BLOC'H on 19/10/2018.
//  Copyright © 2018 OPC. All rights reserved.
//

import UIKit

final class CatalogViewControllerDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {

    typealias Item = CatalogViewModel.Item

    private enum VisibleItem {
        case stuff(name: String)
    }

    private var items: [VisibleItem] = []

    // MARk: - Public

    func update(with items: [Item]) {
        self.items = items.map { item -> VisibleItem in
            switch item {
            case .stuff(name: let name):
                return .stuff(name: name)
            }
        }
    }

    var didSelectItemAtIndex: ((Int) -> Void)?

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.item < items.count else {
            fatalError("Index out of range")
        }

        switch items[indexPath.item] {
        case .stuff(name: let name):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as! ItemTableViewCell
            cell.nameLabel.text = name
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.item < items.count else {
            assertionFailure("Index out of range 🔥")
            return
        }

        didSelectItemAtIndex?(indexPath.item)
    }
}


