//
//  DTOUser.swift
//  HackPoint
//
//  Created by Maxim Butin on 25.06.2022.
//

import Foundation

struct DTOUser: Codable {
    var id: Int
    var login: String
    var github: String?
}
