//
//  Storyboarded.swift
//  HackPoint
//
//  Created by Maxim Butin on 15.05.2021.
//

import UIKit

enum StoryboardType: String {
    case main = "Main"
    case schedule = "Schedule"
}

// A protocol that lets us instantiate view controllers from Main storyboard.
protocol Storyboarded { }

extension Storyboarded where Self: UIViewController {
    static func instantiate(storyboardName: StoryboardType = StoryboardType.main) -> Self {
        let storyboardIdentifier = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }
}
