//
//  TeamCell.swift
//  HackPoint
//
//  Created by Maxim Butin on 15.05.2021.
//

import UIKit

class TeamCell: UITableViewCell, Reusable {
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var scorceLabel: UILabel!
  @IBOutlet weak var checkMark: UIImageView!
  @IBOutlet weak var containerView: UIView!
  
  var selectTeamHandler: (() -> Void)?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(selectTeam(_ :)))
    containerView.addGestureRecognizer(tap)
  }
  
  @objc func selectTeam(_ sender: UITapGestureRecognizer) {
    selectTeamHandler?()
  }
  
  func update(name: String, score: String, statusFinalPitch: String?) {
    nameLabel.text = name
    scorceLabel.text = score
    
    if statusFinalPitch == "present" || statusFinalPitch != nil {
      checkMark.isHidden = false
      scorceLabel.isHidden = false
    } else {
      checkMark.isHidden = true
      scorceLabel.isHidden = true
    }
    
  }
  
}
