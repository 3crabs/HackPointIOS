//
//  AuthEndPoint.swift
//  HackPoint
//
//  Created by Maxim Butin on 16.05.2021.
//

import Foundation
import Alamofire

enum AuthEndpoint: APIConfiguration {
    struct ParameterKey {
        static let login = "login"
        static let password = "password"
        static let isMobile = "isMobile"
    }
    
    case login(login: String, password: String, isMobile: Bool)
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "user/login"
        }
    }
    
    var parameters: RequestParams? {
        switch self {
        case .login(let login, let password, let isMobile):
            var params = Parameters()
            params[ParameterKey.login] = login
            params[ParameterKey.password] = password
            params[ParameterKey.isMobile] = isMobile
            return .body(params)
        }
    }
}
