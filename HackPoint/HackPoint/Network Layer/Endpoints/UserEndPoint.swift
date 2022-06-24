//
//  UserEndPoint.swift
//  HackPoint
//
//  Created by Maxim Butin on 25.06.2022.
//

import Foundation
import Alamofire

enum UserEndPoint: APIConfiguration {
    
    struct ParameterKey {
        static let name = "name"
        static let surname = "surname"
        static let login = "login"
        static let password = "password"
        static let github = "github"
    }
    
    case registration(name: String, surname: String?, login: String, password: String, github: String?)
    case getRoles
    
    var method: HTTPMethod {
        switch self {
        case .registration:
            return .post
        case .getRoles:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getRoles:
            return "/user/roles"
        case .registration:
            return "/user/registration"
        }
    }
    
    var parameters: RequestParams? {
        switch self {
        case .getRoles:
            return nil
        case .registration(let name, let surname, let login, let password, let github):
            var param = Parameters()
            param[ParameterKey.name] = name
            param[ParameterKey.surname] = surname
            param[ParameterKey.login] = login
            param[ParameterKey.password] = password
            param[ParameterKey.github] = github
            return .body(param)
        }
    }
}
