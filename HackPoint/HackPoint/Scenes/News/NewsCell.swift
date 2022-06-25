//
//  NewsCell.swift
//  HackPoint
//
//  Created by Maxim Butin on 25.06.2022.
//

import UIKit
import SDWebImage

struct NewsViewModel {
    var date: String
    var newsItem: NewsItem
}

class NewsCell: UITableViewCell, Reusable {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var newsImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
}

extension NewsCell: Configurable {
    
    func set(model: NewsViewModel) {
        titleLabel.text = model.newsItem.title
        descriptionLabel.text = model.newsItem.description
        timeLabel.text = model.date
        newsImageView.sd_setHighlightedImage(with: URL(string: model.newsItem.imageURL!))
    }
}
