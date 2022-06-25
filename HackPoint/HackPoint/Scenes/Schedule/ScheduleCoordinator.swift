//
//  ScheduleCoordinator.swift
//  HackPoint
//
//  Created by Maxim Butin on 25.06.2022.
//

import UIKit

class ScheduleCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController = UINavigationController()
    
    init() {
        navigationController.navigationBar.prefersLargeTitles = true
        
        let viewController = ScheduleViewController.instantiate()
        viewController.tabBarItem = UITabBarItem(title: "Расписание",
                                                 image: UIImage(systemName: "calendar.badge.clock"),
                                                 tag: 0)
        viewController.coordinator = self
        
        navigationController.viewControllers = [viewController]
    }
}

extension UIImage {
    /// Creates a UIImage instance from a filename in our bundle.
    convenience init(bundleName: String) {
        self.init(named: bundleName)!
    }
}
