//
//  ProfileCoordinator.swift
//  HackPoint
//
//  Created by Maxim Butin on 25.06.2022.
//

import UIKit

protocol ProfileCoordinatorProtocol: HackCoordinator {
    func showProfileViewController()
}

class ProfileCoordinator: ProfileCoordinatorProtocol {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators = [HackCoordinator]()
    var type: CoordinatorType { .tab }
        
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.prefersLargeTitles = true
    }
        
    func start() {
        showProfileViewController()
    }
    
    deinit {
        print("ProfileCoordinator deinit")
    }
    
    func showProfileViewController() {
        let profileVC = ProfileViewController.instantiate(storyboardName: .profile)
        profileVC.coordinator = self
        profileVC.didSendEventClosure = {
            [weak self] event in
            
            self?.finish()
        }
        
        navigationController.pushViewController(profileVC, animated: true)
    }
}

