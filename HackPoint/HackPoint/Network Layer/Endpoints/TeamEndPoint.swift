//
//  TeamEndPoint.swift
//  HackPoint
//
//  Created by Maxim Butin on 16.05.2021.
//

import Foundation
import Alamofire

enum TeamEndPoint: APIConfiguration {
    struct ParameterKey {
        static let id = "id"
        static let statusFinalPitch = "statusFinalPitch"
    }
    
    case team
    case update(id: Int, statusFinalPitch: String)
    
    var method: HTTPMethod {
        switch self {
        case .team:
            return .get
        case .update:
            return .put
        }
    }
    
    var path: String {
        switch self {
        case .team:
            return "/admin/team"
        case .update(let id, _):
            return "/admin/team/\(id)"
        }
    }
    
    var parameters: RequestParams? {
        switch self {
        case .team:
            return nil
        case .update(_, let statusFinalPitch):
            var param = Parameters()
            param[ParameterKey.statusFinalPitch] = statusFinalPitch
            return .body(param)
        }
    }
}
