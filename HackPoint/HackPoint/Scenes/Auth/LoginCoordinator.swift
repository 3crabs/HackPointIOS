//
//  LoginCoordinator.swift
//  HackPoint
//
//  Created by Maxim Butin on 25.06.2022.
//

import UIKit

protocol LoginCoordinatorProtocol: HackCoordinator {
    func showLoginViewController()
}

class LoginCoordinator: LoginCoordinatorProtocol {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators = [HackCoordinator]()
    var type: CoordinatorType { .login }
        
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
        
    func start() {
        showLoginViewController()
    }
    
    deinit {
        print("LoginCoordinator deinit")
    }
    
    func showLoginViewController() {
        let loginVC = LoginViewController.instantiate()
        loginVC.coordinator = self
        loginVC.didSendEventClosure = {
            [weak self] event in

            self?.finish()
        }

        navigationController.pushViewController(loginVC, animated: true)
        
//        let registrationTeamVC = RegistrationTeamViewController.instantiate()
//        registrationTeamVC.coordinator = self
//        registrationTeamVC.didSendEventClosure = {
//            [weak self] event in
//
//            self?.finish()
//        }
//
//        navigationController.pushViewController(registrationTeamVC, animated: true)
    }
    
    func showRegistrationViewController() {
        let registrationVC = RegistrationViewController.instantiate()
        registrationVC.coordinator = self
        registrationVC.didSendEventClosure = {
            [weak self] event in
            
            self?.finish()
        }
        
        navigationController.pushViewController(registrationVC, animated: true)
    }
    
    func goLoginViewController() {
        navigationController.popViewController(animated: true)
    }
}
