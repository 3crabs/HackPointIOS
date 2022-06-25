//
//  TabBarPage.swift
//  HackPoint
//
//  Created by Maxim Butin on 25.06.2022.
//

import UIKit

enum TabBarPage {
    case schedule
    case news

    init?(index: Int) {
        switch index {
        case 0:
            self = .news
        case 1:
            self = .schedule
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .news:
            return "Лента"
        case .schedule:
            return "Расписание"
        }
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .news:
            return 0
        case .schedule:
            return 1
        }
    }

    func pageIcon() -> UIImage? {
        switch self {
        case .news:
            return UIImage(systemName: "newspaper")
        case .schedule:
            return UIImage(systemName: "calendar.badge.clock")
        }
    }
}
