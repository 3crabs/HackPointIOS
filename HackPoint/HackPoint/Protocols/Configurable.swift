//
//  Configurable.swift
//  HackPoint
//
//  Created by Maxim Butin on 25.06.2022.
//

import Foundation

public protocol Configurable {
    
    associatedtype Model
    
    func set(model: Model)
}
