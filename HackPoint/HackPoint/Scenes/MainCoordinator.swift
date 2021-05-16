//
//  MainCoordinator.swift
//  HackPoint
//
//  Created by Maxim Butin on 15.05.2021.
//

import UIKit

class MainCoordinator: Coordinator {

  var navigationController: NavigationController = NavigationController()
  var childCoordinators = [Coordinator]()

  init(navigationController: NavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let loginViewController = LoginViewController.instantiate()
    loginViewController.coordinator = self
    navigationController.viewControllers = [loginViewController]
  }
  
  func openHomeScreen(referee: DTOReferee?) {
    let homeViewController = HomeViewController.instantiate()
    homeViewController.coordinator = self
    homeViewController.referee = referee
    navigationController.pushViewController(homeViewController, animated: true)
  }
  
  func openTeamScreen() {
    let teamViewController = TeamViewController.instantiate()
    teamViewController.coordinator = self
    navigationController.pushViewController(teamViewController, animated: true)
  }
  
  func openMarkScreen(team: DTOTeam?) {
    let markViewController = MarkViewController.instantiate()
    markViewController.coordintar = self
    markViewController.team = team
    navigationController.pushViewController(markViewController, animated: true)
  }


}



