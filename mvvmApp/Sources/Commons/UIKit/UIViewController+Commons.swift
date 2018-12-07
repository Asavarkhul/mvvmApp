//
//  UIViewController+Commons.swift
//  mvvmApp
//
//  Created by Bertrand BLOC'H on 07/12/2018.
//  Copyright © 2018 OPC. All rights reserved.
//

import UIKit

extension UIViewController {

    public static var storyboardIdentifier: String {
        return String(describing: self)
    }

    public static var nib: UINib {
        return UINib.init(nibName: storyboardIdentifier, bundle: Bundle(for: self))
    }
}
