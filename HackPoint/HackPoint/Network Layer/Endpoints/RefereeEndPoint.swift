//
//  RefereeEndPoint.swift
//  HackPoint
//
//  Created by Maxim Butin on 16.05.2021.
//

import Foundation
import Alamofire

enum RefereeEndPoint: APIConfiguration {
  struct ParameterKey {
    static let teamId = "teamId"
    static let id = "id"
    static let point = "point"
  }
  
  case note(teamId: Int)
  case point(id: Int, point: Int)
  case getPoints
  case getPointWithNote(teamId: Int)
  
  var method: HTTPMethod {
    switch self {
    case .note:
      return .get
    case .point:
      return .put
    case .getPoints:
      return .get
    case .getPointWithNote:
      return .get
    }
  }
  
  var path: String {
    switch self {
    case .note:
      return "/referee/point/note"
    case .point(let id, _):
      return "/referee/point/\(id)"
    case .getPoints:
      return "/referee/point"
    case .getPointWithNote:
      return "/referee/point/note"
    }
  }
  
  var parameters: RequestParams? {
    switch self {
    case .note(let teamId):
      var param = Parameters()
      param[ParameterKey.teamId] = teamId
      return .url(param)
    case .point(_, let point):
      var param = Parameters()
      param[ParameterKey.point] = point
      return .body(param)
    case .getPoints:
      return nil
    case .getPointWithNote(let teamId):
      var param = Parameters()
      param[ParameterKey.teamId] = teamId
      return .url(param)
    }
  }
}
