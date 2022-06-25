//
//  AppCoordinator.swift
//  HackPoint
//
//  Created by Maxim Butin on 25.06.2022.
//

import UIKit

protocol AppCoordinatorProtocol: HackCoordinator {
    
    func showLoginFlow()
    func showMainFlow()
}

class AppCoordinator: AppCoordinatorProtocol {
    
    weak var finishDelegate: CoordinatorFinishDelegate? = nil
    var navigationController: UINavigationController
    var childCoordinators = [HackCoordinator]()
    var type: CoordinatorType { .app }
    
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }
    
    func start() {
        showLoginFlow()
    }
    
    func showLoginFlow() {
        let loginCoordinator = LoginCoordinator(navigationController)
        loginCoordinator.finishDelegate = self
        loginCoordinator.start()
        childCoordinators.append(loginCoordinator)
    }
    
    func showMainFlow() {
        let tabCoordinator = TabCoordinator.init(navigationController)
        tabCoordinator.finishDelegate = self
        tabCoordinator.start()
        childCoordinators.append(tabCoordinator)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    
    func coordinatorDidFinish(childCoordinator: HackCoordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        
        switch childCoordinator.type {
        case .tab:
            navigationController.viewControllers.removeAll()
            showLoginFlow()
        case .login:
            navigationController.viewControllers.removeAll()
            showMainFlow()
        default:
            break
        }
    }
}
