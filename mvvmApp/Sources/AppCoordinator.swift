//
//  AppCoordinator.swift
//  mvvmApp
//
//  Created by Bertrand BLOC'H on 26/10/2018.
//  Copyright © 2018 OPC. All rights reserved.
//

import UIKit

final class AppCoordinator {

    // MARK: - Properties

    private unowned var appDelegate: AppDelegate

    private var homeCoordinator: HomeCoordinator?

    // MARK: - Initializer

    init(appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
    }

    // MARK: - Coodinator

    func start() {
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate.window!.rootViewController = UIViewController()
        appDelegate.window!.makeKeyAndVisible()

        showHome()
    }

    private func showHome() {
        homeCoordinator = HomeCoordinator(presenter: appDelegate.window!)
        homeCoordinator?.start()
    }
}
