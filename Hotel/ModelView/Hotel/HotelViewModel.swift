//
//  HotelViewModel.swift
//  Hotel
//
//  Created by Алексей Баранов on 06.09.2023.
//

import Foundation
import SwiftUI

class HotelViewModel: ObservableObject {
    private let client = NetworkManager()
    @MainActor @Published private(set) var hotel: HotelModel?
    
    var request: URLRequest = {
        let urlString = "https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3"
        let url = URL(string: urlString)!
        return URLRequest(url: url)
    }()
    
    func fetchHotels() async {
        let response = await client.fetch(type: HotelModel.self, with: request)
        switch response {
        case .success(let success):
            Task { @MainActor in
                hotel = success
            }
        case .failure(let failure):
            print(failure.localizedDescription)
        }
    }
}


