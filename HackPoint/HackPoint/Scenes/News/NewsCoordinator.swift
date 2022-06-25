//
//  NewsCoordinator.swift
//  HackPoint
//
//  Created by Maxim Butin on 25.06.2022.
//

import UIKit

protocol NewsCoordinatorProtocol: HackCoordinator {
    func showNewsViewController()
}

class NewsCoordinator: NewsCoordinatorProtocol {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators = [HackCoordinator]()
    var type: CoordinatorType { .tab }
        
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.prefersLargeTitles = true
    }
        
    func start() {
        showNewsViewController()
    }
    
    deinit {
        print("LoginCoordinator deinit")
    }
    
    func showNewsViewController() {
        let newsVC = NewsViewController.instantiate(storyboardName: .news)
        newsVC.coordinator = self
        newsVC.didSendEventClosure = {
            [weak self] event in
            
            self?.finish()
        }
        
        navigationController.pushViewController(newsVC, animated: true)
    }
}
