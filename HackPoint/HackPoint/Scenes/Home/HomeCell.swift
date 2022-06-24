//
//  MainTableCell.swift
//  HackPoint
//
//  Created by Maxim Butin on 15.05.2021.
//

import UIKit

enum Status {
    case finish
    case progress
}

class HomeCell: UITableViewCell, Reusable {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var statusImageView: UIImageView!
    @IBOutlet private weak var resultButton: UIButton!
    
    var openTeamAction: (() -> Void)?
    
    func update(name: String, date: String, status: Status) {
        switch status {
        case .finish:
            statusImageView.image = UIImage(named: "finish")
            resultButton.backgroundColor = .systemGray5
            resultButton.setTitle("Результаты", for: .normal)
            resultButton.setTitleColor(.gray, for: .normal)
            resultButton.isEnabled = false
        case .progress:
            statusImageView.image = UIImage(named: "progress")
            resultButton.backgroundColor = .link
            resultButton.setTitle("Оценка", for: .normal)
            resultButton.setTitleColor(.white, for: .normal)
            resultButton.isEnabled = true
        }
        
        nameLabel.text = name
        dateLabel.text = date
    }
    
    @IBAction func openTeamScreen(_ sender: UIButton) {
        openTeamAction?()
    }
    
}

