//
//  SecondCoordinator.swift
//  Coordinator
//
//  Created by Arthur Sobrosa on 03/12/24.
//

import UIKit

/// conforms to NSObject so that class can be able to conform to UIViewControllerTransitioningDelegate
class SecondCoordinator: NSObject, Coordinator, ShowingThirdVC {
    weak var parentCoordinator: Coordinator? /// create a variable to store parent coordinator
    var childCoordinators: [any Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = SecondViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showThirdVC() {
        let child = ThirdCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }
}

/// this will observe any transitions happening when a view controller is presented by second coordinator
extension SecondCoordinator: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> (any UIViewControllerAnimatedTransitioning)? {
        
        /// unwrap thirdVC when it's dismissed
        guard let navigationController = dismissed as? UINavigationController,
              let thirdViewController = navigationController.viewControllers.first as? ThirdViewController else {
            
            return nil
        }
        
        /// call method that removes third coordinator from second coordinator's child coordinators
        childDidFinish(thirdViewController.coordinator as? Coordinator)
        return nil
    }
}
