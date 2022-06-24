//
//  APIConfiguration.swift
//  HackPoint
//
//  Created by Maxim Butin on 15.05.2021.
//

import Foundation
import Alamofire

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: RequestParams? { get }
}


extension APIConfiguration {
    
    func asURLRequest() throws -> URLRequest {
        let url = try K.ProductionServer.baseURL.asURL()
        
        var request = URLRequest(url: url.appendingPathComponent(path))
        
        
        // HTTP Method
        request.httpMethod = method.rawValue
        
        // Common Headers
        request.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        request.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        let defaults = UserDefaults.standard
        let token = defaults.string(forKey: "Token")
        if let token = token {
            request.setValue(ContentType.bearer.rawValue + " " + token, forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
        }
        
        
        // Parameters
        if let parameters = parameters {
            switch parameters {
            case .body(let params):
                do {
                    request.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
                } catch {
                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                }
            case .url(let params):
                do {
                    request = try URLEncoding(destination: .queryString, arrayEncoding: .noBrackets).encode(request, with: params)
                } catch {
                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                }
            }
        }
        
        return request
    }
}
