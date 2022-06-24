//
//  DTORefree.swift
//  HackPoint
//
//  Created by Maxim Butin on 16.05.2021.
//

import Foundation

struct DTOResult: Codable {
    let referee: DTOReferee
    let token: String
}

struct DTOReferee: Codable {
    let id: Int
    let login: String
    let name: String
    let password: String
    let surname: String?
}
