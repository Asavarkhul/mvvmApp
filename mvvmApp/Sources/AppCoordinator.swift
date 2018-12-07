//
//  AppCoordinator.swift
//  mvvmApp
//
//  Created by Bertrand BLOC'H on 26/10/2018.
//  Copyright © 2018 OPC. All rights reserved.
//

import UIKit

final class AppCoordinator {

    // MARK: - Private properties

    private unowned var appDelegate: AppDelegate

    private var homeCoordinator: CatalogCoordinator?

    // MARK: - Initializer

    init(appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
    }

    // MARK: - Coordinator

    func start() {
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate.window!.rootViewController = UIViewController()
        appDelegate.window!.makeKeyAndVisible()

        if ProcessInfo.processInfo.environment["IS_RUNNING_UNIT_TESTS"] == "YES" {
            return
        }

        showHome()
    }

    private func showHome() {
        homeCoordinator = CatalogCoordinator(presenter: appDelegate.window!)
        homeCoordinator?.start()
    }
}
