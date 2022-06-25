//
//  Coordinator.swift
//  HackPoint
//
//  Created by Maxim Butin on 24.06.2022.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
}

protocol HackCoordinator: AnyObject {
    
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    var navigationController: UINavigationController { get set }
    var childCoordinators: [HackCoordinator] { get set }
    var type: CoordinatorType { get }
    func start()
    func finish()
    
    init(_ navigationController: UINavigationController)
}

extension HackCoordinator {
    func finish() {
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: HackCoordinator)
}

enum CoordinatorType {
    case app, login, tab
}
