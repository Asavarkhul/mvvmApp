//
//  AppDelegate.swift
//  mvvmApp
//
//  Created by Bertrand BLOC'H on 19/10/2018.
//  Copyright © 2018 OPC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: AppCoordinator!
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        coordinator = AppCoordinator(appDelegate: self)
        coordinator.start()
        return true
    }
}

