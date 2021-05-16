//
//  APIConstant.swift
//  HackPoint
//
//  Created by Maxim Butin on 16.05.2021.
//

import Foundation
import Alamofire

struct K {
  struct ProductionServer {
    static let baseURL = "http://34.91.29.64:3000/api"
  }

  struct APIParameterKey {
//    static let password = "pass"
//    static let login = "admin"
//    static let isMobile = true
  }
}

enum HTTPHeaderField: String {
  case authentication = "Authorization"
  case contentType = "Content-Type"
  case acceptType = "Accept"
  case acceptEncoding = "Accept-Encoding"
}


enum ContentType: String {
  case json = "application/json"
  case bearer = "Bearer"
}

enum RequestParams {
    case body(_ :Parameters)
    case url(_ :Parameters)
}
