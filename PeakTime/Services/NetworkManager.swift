//
//  Services/NetworkManager.swift
//  PeakTime
//
//

import Foundation
import Alamofire

class NetworkManager: ObservableObject{
    static let shared = NetworkManager()
    
    private init(){}
    
    func request<T: Codable>(
        _ url: String,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        headers: HTTPHeaders? = nil,
    )async throws -> T {
        
        return try await withCheckedThrowingContinuation{ continuation in
            AF.request(url, method: method, parameters: parameters, headers: headers)
                .validate()
                .responseDecodable(of: T.self){
                    response in
                    switch response.result{
                    case .success(let value):
                        continuation.resume(returning: value)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
}
