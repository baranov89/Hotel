//
//  NetworkManager.swift
//  Hotel
//
//  Created by Алексей Баранов on 06.09.2023.
//

import Foundation

class NetworkManager {
    func fetch<T: Codable>(type: T.Type, with request: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: request)
      guard let httpResponse = response as? HTTPURLResponse else {
          throw ApiError.requestFailed
      }
      guard httpResponse.statusCode == 200 else {
       throw ApiError.responseUnsuccessful
      }
      do {
       let decoder = JSONDecoder()
       return try decoder.decode(type, from: data)
      } catch {
       throw ApiError.invalidData
      }
     }

}

enum ApiError: Error {
    case requestFailed
    case invalidData
    case responseUnsuccessful
}
