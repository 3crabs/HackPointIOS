//
//  TeamViewController.swift
//  HackPoint
//
//  Created by Maxim Butin on 15.05.2021.
//

import UIKit

class TeamViewController: BaseViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    var teams: [DTOTeam] = []
    
    @IBOutlet private weak var teamTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamTableView.delegate = self
        teamTableView.dataSource = self
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getTeam()
    }
    
    func getTeam() {
        showProgressHUD()
        APIClient.shared.getTeam {  [weak self] result in
            switch result {
            case .success(let result):
                self?.teams = result
                self?.hideProgressHUD()
                self?.teamTableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}


extension TeamViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TeamCell.reuseId, for: indexPath) as? TeamCell else { fatalError("Not found \(TeamCell.reuseId)" )}
        
        let team = teams[indexPath.row]
        cell.update(
            name: team.name!,
            score: "\(team.point!)",
            statusFinalPitch: team.statusFinalPitch
        )
        
        cell.selectTeamHandler = { [weak self] in
//            self?.coordinator?.openMarkScreen(team: team)
        }
        return cell
    }
    
}
