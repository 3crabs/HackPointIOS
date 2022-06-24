//
//  APIClient.swift
//  HackPoint
//
//  Created by Maxim Butin on 16.05.2021.
//

import Foundation
import Alamofire

class APIClient {
    
    static var shared: APIClient = {
        let instance = APIClient()
        return instance
    }()
    
    private init() {}
    
    let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 30
        configuration.waitsForConnectivity = true
        let networkLogger = NetworkLogger()
        return Session(configuration: configuration, eventMonitors: [networkLogger])
    }()
    
    func login(login: String, password: String, completion: @escaping(Result<DTOResult, AFError>) -> Void) {
        request(router: AuthEndpoint.login(login: login, password: password, isMobile: true), completion: completion)
    }
    
    func getTeam(completion: @escaping(Result<[DTOTeam], AFError>) -> Void) {
        request(router: TeamEndPoint.team, completion: completion)
    }
    
    func getNote(teamId: Int, completion: @escaping(Result<DTOPointWithNotes, AFError>) -> Void) {
        request(router: RefereeEndPoint.note(teamId: teamId), completion: completion)
    }
    
    func putPoint(id: Int, point: Int, completion: @escaping(Result<DTOResultRefereePoint, AFError>) -> Void) {
        request(router: RefereeEndPoint.point(id: id, point: point), completion: completion)
    }
    
    func getPoints(completion:  @escaping(Result<[DTONote], AFError>) -> Void) {
        request(router: RefereeEndPoint.getPoints, completion: completion)
    }
    
    func getPointWithNote(teamId: Int, completion: @escaping(Result<DTOPointWithNotes, AFError>) -> Void) {
        request(router: RefereeEndPoint.getPointWithNote(teamId: teamId), completion: completion)
    }
    
    func putTeam(id: Int, completion: @escaping(Result<DTOTeam, AFError>) -> Void) {
        request(router: TeamEndPoint.update(id: id, statusFinalPitch: "present"), completion: completion)
    }
    
    func request<T: Codable>(router: APIConfiguration, decoder: DataDecoder? = nil, completion: @escaping(Result<T, AFError>) -> ())  {
        let jsonDecoder = JSONDecoder()
        //    jsonDecoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
        sessionManager.request(router)
            .responseDecodable(decoder: jsonDecoder) { (response: DataResponse<T, AFError>) in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

