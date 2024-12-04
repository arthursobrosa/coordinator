//
//  ThirdCoordinator.swift
//  Coordinator
//
//  Created by Arthur Sobrosa on 03/12/24.
//

import UIKit

class ThirdCoordinator: Coordinator, Dismissing {
    weak var parentCoordinator: Coordinator? /// create a variable to store parent coordinator
    var childCoordinators: [any Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ThirdViewController()
        viewController.coordinator = self
        
        /// create new navigation controller containing third VC to make its title not be hidden
        let newNavigationController = UINavigationController(rootViewController: viewController)
        
        /// unwrap parent coordinator and set is as the transitioning delegate
        if let secondCoordinator = parentCoordinator as? SecondCoordinator {
            newNavigationController.transitioningDelegate = secondCoordinator
        }
        
        newNavigationController.modalPresentationStyle = .pageSheet
        newNavigationController.modalTransitionStyle = .flipHorizontal
        
        /// use 'present' and not 'push' when dealing with modals
        navigationController.present(newNavigationController, animated: true)
    }
    
    func dismiss() {
        navigationController.dismiss(animated: true)
    }
}
