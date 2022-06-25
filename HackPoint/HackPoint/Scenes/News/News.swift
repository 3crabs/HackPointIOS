//
//  News.swift
//  HackPoint
//
//  Created by Maxim Butin on 25.06.2022.
//

import Foundation

struct NewsItem {
    
    var title: String
    var description: String
    var imageURL: String?
}

struct News {
    var date: String
    var newsItem: [NewsItem]
}
