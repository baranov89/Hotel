//
//  NetworkManager.swift
//  Hotel
//
//  Created by Алексей Баранов on 06.09.2023.
//

import Foundation

class NetworkManager {
    static var instance = NetworkManager()
    
    private init() {}
    
    func fetch<T: Codable>(type: T.Type, with request: URLRequest) async -> Result<T, Error> {
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            let result = try decoder.decode(type, from: data)
            return .success(result)
        } catch {
            print(error)
            return .failure(error)
        }
    }
}
