//
//  DTORole.swift
//  HackPoint
//
//  Created by Maxim Butin on 25.06.2022.
//

import Foundation

enum DTORole: String, CustomStringConvertible, Codable {

    case participant
    case referee
    case organizer
    case expert
    case partner
    
    var description: String {
        switch self {
        case .participant:
            return "Участник"
        case .referee:
            return "Судья"
        case .organizer:
            return "Организатор"
        case .expert:
            return "Эксперт"
        case .partner:
            return "Партнер"
        }
    }
}
