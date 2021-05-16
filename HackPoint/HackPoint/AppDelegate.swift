//
//  AppDelegate.swift
//  HackPoint
//
//  Created by Maxim Butin on 15.05.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var coordinator: MainCoordinator?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let navController = NavigationController()
    coordinator = MainCoordinator(navigationController: navController)
    coordinator?.start()
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = navController
    window?.makeKeyAndVisible()
    return true
  }
}

