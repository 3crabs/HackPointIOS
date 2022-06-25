//
//  MainTabBarController.swift
//  HackPoint
//
//  Created by Maxim Butin on 25.06.2022.
//

import UIKit

class MainTabBarController: UITabBarController, Storyboarded {
    
    let sheduleCoordinator = ScheduleCoordinator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [sheduleCoordinator.navigationController]
    }
}
