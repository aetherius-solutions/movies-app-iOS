//
//  UINavigationController+GestureRecognizer.swift
//  MoviesApp
//
//  Created by Nikola Savic on 1.4.24.
//

import Foundation
import UIKit

extension UINavigationController: UIGestureRecognizerDelegate, UINavigationControllerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
        delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }

    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if let coordinator = navigationController.topViewController?.transitionCoordinator {
            coordinator.notifyWhenInteractionChanges { (context) in
                if !context.isCancelled {
                    navigationController.tabBarController?.tabBar.isHidden = navigationController.viewControllers.count != 1
                }
            }
        }
    }

}
