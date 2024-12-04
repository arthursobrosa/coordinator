//
//  FirstCoordinator.swift
//  Coordinator
//
//  Created by Arthur Sobrosa on 03/12/24.
//

import UIKit

/// conforms to NSObject so that class can be able to conform to UINavigationControllerDelegate
class FirstCoordinator: NSObject, Coordinator, ShowingSecondVC {
    var childCoordinators: [any Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let viewController = FirstViewController() /// instantiate view controller to be presented
        viewController.coordinator = self /// set its coordinator to self, meaning that FirstCoordinator will control any navigation on FirstViewController
        navigationController.pushViewController(viewController, animated: true) /// show viewcontroller
    }
    
    func showSecondVC() {
        let child = SecondCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }
}

/// thils will observe pushes from a navigaton controller
extension FirstCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }

        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        if let secondViewController = fromViewController as? SecondViewController {
            childDidFinish(secondViewController.coordinator as? Coordinator)
        }
    }
}
