//
//  NetworkLogger.swift
//  HackPoint
//
//  Created by Maxim Butin on 16.05.2021.
//


import Foundation
import Alamofire

class NetworkLogger: EventMonitor {
  let queue = DispatchQueue(label: "3crabs.networkLogger")

  func requestDidFinish(_ request: Request) {
    print(request.description)
  }

  func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
    guard let data = response.data else {
      return
    }

    if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
      if let data = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
         let jsonString = String(data: data, encoding: .utf8) {
        print(jsonString)
      }
    }


  }
}
