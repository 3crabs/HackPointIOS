//
//  NewsCoordinator.swift
//  HackPoint
//
//  Created by Maxim Butin on 25.06.2022.
//

import UIKit

protocol ScheduleCoordinatorProtocol: HackCoordinator {
    func showScheduleViewController()
}

class ScheduleCoordinator: ScheduleCoordinatorProtocol {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators = [HackCoordinator]()
    var type: CoordinatorType { .tab }
        
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
        
    func start() {
        showScheduleViewController()
    }
    
    deinit {
        print("LoginCoordinator deinit")
    }
    
    func showScheduleViewController() {
        let scheduleVC = ScheduleViewController.instantiate()
        scheduleVC.coordinator = self
        scheduleVC.didSendEventClosure = {
            [weak self] event in
            
            self?.finish()
        }
        
        navigationController.pushViewController(scheduleVC, animated: true)
    }
}

