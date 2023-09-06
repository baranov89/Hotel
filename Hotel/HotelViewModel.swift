//
//  HotelViewModel.swift
//  Hotel
//
//  Created by Алексей Баранов on 06.09.2023.
//

import Foundation

class HotelViewModel: ObservableObject {
     private let client = NetworkManager()
     @Published private(set) var hotels: [HotelModel] = []

     var request: URLRequest = {
      let urlString = "https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3"
      let url = URL(string: urlString)!
      return URLRequest(url: url)
     }()

     func fetchHotels() async {
      do {
       let response = try await client.fetch(type: HotelModel.self, with: request)
          hotels.append(response)
      } catch {
          print(error.localizedDescription)
      }
     }
    }
