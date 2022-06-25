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
    var loginCoordinator: LoginCoordinator?
    var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupStart()
        return true
    }
    
    func setupStart() {
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        appCoordinator = AppCoordinator(navigationController)
        appCoordinator?.start()
    }
}

