//
//  RegistrationTeamViewController.swift
//  HackPoint
//
//  Created by Maxim Butin on 26.06.2022.
//

import UIKit

class RegistrationTeamViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var tableView: UITableView!
    var teams = [Team]()
    var mockData = RegistrationTeamMockData.getData()
    
    var didSendEventClosure: ((RegistrationTeamViewController.Event) -> Void)?
    var coordinator: LoginCoordinator?
    
    lazy var addCommandView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addCommandButton)
        NSLayoutConstraint.activate([
            addCommandButton.topAnchor.constraint(equalTo: view.topAnchor),
            addCommandButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            addCommandButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addCommandButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
        return view
    }()
    
    lazy var addCommandButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Создать команду", for: .normal)
        button.backgroundColor = .link
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18)
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup() {
        view.addSubview(addCommandView)
        
        NSLayoutConstraint.activate([
            addCommandView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            addCommandView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            addCommandView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        addCommandButton.layer.cornerRadius = 10
    }
}

extension RegistrationTeamViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mockData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RegistrationTeamCell.reuseId,
                                                       for: indexPath) as? RegistrationTeamCell else {
            fatalError("Not found \(RegistrationTeamCell.reuseId)")
        }
        let team = mockData[indexPath.row]
        cell.set(model: RegistrationTeamViewModel(title: team.name))
        return cell
    }
}

extension RegistrationTeamViewController {
    enum Event {
        case registerTeam
    }
}
