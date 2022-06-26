//
//  AboutCoordinator.swift
//  HackPoint
//
//  Created by Maxim Butin on 26.06.2022.
//

import UIKit

protocol AboutCoordinatorProtocol: HackCoordinator {
    func showAboutViewController()
}

class AboutCoordinator: AboutCoordinatorProtocol {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators = [HackCoordinator]()
    var type: CoordinatorType { .tab }
        
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.prefersLargeTitles = true
    }
        
    func start() {
        showAboutViewController()
    }
    
    deinit {
        print("ProfileCoordinator deinit")
    }
    
    func showAboutViewController() {
        let aboutVC = AboutViewController.instantiate()
        aboutVC.coordinator = self
        aboutVC.didSendEventClosure = {
            [weak self] event in
            
            self?.finish()
        }
        
        navigationController.pushViewController(aboutVC, animated: true)
    }
}

