//
//  navigation.swift
//  Short iOS
//
//  Created by 진세진 on 2023/11/25.
//

import UIKit

extension UINavigationController {
    
    func pushViewController(_ viewController: UIViewController, animated: Bool, hidesBackButton: Bool) {
        viewController.navigationItem.hidesBackButton = hidesBackButton
        pushViewController(viewController, animated: animated)
    }
}
