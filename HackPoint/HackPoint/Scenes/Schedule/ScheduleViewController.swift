//
//  ScheduleViewController.swift
//  HackPoint
//
//  Created by Maxim Butin on 25.06.2022.
//

import UIKit

class ScheduleViewController: UIViewController, Storyboarded {
    
    var coordinator: ScheduleCoordinator?
    var mockData = ScheduleMockData.getData()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        title = "Расписание"
    }
    
    func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
}

extension ScheduleViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        mockData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mockData[section].event.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleCell.reuseId,
                                                       for: indexPath) as? ScheduleCell else {
            fatalError("Not found \(ScheduleCell.reuseId)")
        }
        let sortedEvent = mockData[indexPath.section].event.sorted { $0.key < $1.key }
        let event = sortedEvent[indexPath.row]
        cell.set(model: Event(time: event.key, eventName: event.value))
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .systemGray6
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Bold", size: 18)
        label.textColor = .systemGray
        label.text = mockData[section].day
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        return view
    }
}
