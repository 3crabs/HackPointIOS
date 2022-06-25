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
