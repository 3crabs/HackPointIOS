//
//  RegistrationTeamCell.swift
//  HackPoint
//
//  Created by Maxim Butin on 26.06.2022.
//

import UIKit

struct RegistrationTeamViewModel {
    
    var title: String
    var isSelected = false
}

class RegistrationTeamCell: UITableViewCell, Reusable {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkboxImageView: UIImageView!
}

extension RegistrationTeamCell: Configurable {
    
    func set(model: RegistrationTeamViewModel) {
        titleLabel.text = model.title
        if model.isSelected {
            checkboxImageView.isHidden = false
            checkboxImageView.image = UIImage(named: "checkbox_on")
        } else {
            checkboxImageView.isHidden = true
        }
    }
}
