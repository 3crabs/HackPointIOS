//
//  ScheduleCell.swift
//  HackPoint
//
//  Created by Maxim Butin on 25.06.2022.
//

import UIKit

struct Event {
    let time: String
    let eventName: String
}

class ScheduleCell: UITableViewCell, Reusable {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var eventNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension ScheduleCell: Configurable {
    
    func set(model: Event) {
        timeLabel.text = model.time
        eventNameLabel.text = model.eventName
    }
}
