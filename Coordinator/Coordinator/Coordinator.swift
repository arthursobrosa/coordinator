//
//  Coordinator.swift
//  Coordinator
//
//  Created by Arthur Sobrosa on 03/12/24.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [any Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    func childDidFinish(_ child: Coordinator?)
}

extension Coordinator {
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() where coordinator === child {
            childCoordinators.remove(at: index)
            break
        }
    }
}
