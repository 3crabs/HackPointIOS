//
//  TabBarPage.swift
//  HackPoint
//
//  Created by Maxim Butin on 25.06.2022.
//

import UIKit

enum TabBarPage {
    case home
    case schedule
    case news
    case profile
    case abouthack

    init?(index: Int) {
        switch index {
        case 0:
            self = .home
        case 1:
            self = .news
        case 2:
            self = .schedule
        case 3:
            self = .profile
        case 4:
            self = .abouthack
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .home:
            return "Главная"
        case .news:
            return "Лента"
        case .schedule:
            return "Расписание"
        case .profile:
            return "Профиль"
        case .abouthack:
            return "О хакатоне"
        }
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .home:
            return 0
        case .news:
            return 1
        case .schedule:
            return 2
        case .profile:
            return 3
        case .abouthack:
            return 4
        }
    }

    func pageIcon() -> UIImage? {
        switch self {
        case .home:
            return UIImage(systemName: "house")
        case .news:
            return UIImage(systemName: "newspaper")
        case .schedule:
            return UIImage(systemName: "calendar.badge.clock")
        case .profile:
            return UIImage(systemName: "person.fill")
        case .abouthack:
            return UIImage(systemName: "info.circle")
        }
    }
}
