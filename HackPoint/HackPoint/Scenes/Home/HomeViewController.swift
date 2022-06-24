//
//  MainViewController.swift
//  HackPoint
//
//  Created by Maxim Butin on 15.05.2021.
//

import UIKit


class HomeViewController: BaseViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    var referee: DTOReferee?
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet private weak var mainTableView: UITableView!
    
    var openTeamScreen: (() -> Void?)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        nameLabel.text = "Привет, \(referee!.name)"
        
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.reuseId, for: indexPath) as? HomeCell else { fatalError("Not found \(HomeCell.reuseId)") }
        
        if indexPath.row == 0 {
            cell.update(name: "Питч идей", date: "пятница, 14 мая", status: .finish)
        } else if indexPath.row == 1 {
            cell.update(name: "Чекпоинт", date: "суббота, 15 мая", status: .finish)
        } else if indexPath.row == 2 {
            cell.update(name: "Демофест", date: "воскресенье, 15 мая", status: .progress)
        }
        
        cell.openTeamAction = { [weak self] in
            self?.coordinator?.openTeamScreen()
        }
        
        return cell
    }
    
    
}
