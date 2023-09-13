//
//  HotelViewModel.swift
//  Hotel
//
//  Created by Алексей Баранов on 06.09.2023.
//

import Foundation
import SwiftUI

class HotelViewModel: ObservableObject {
    @Published private(set) var hotel: HotelModel?
    private let client = NetworkManager.instance
    
    // if API doesn't work
    
    //    init() {
    //        hotel = HotelModel(id: 1,
    //                           name: "Лучший пятизвездочный отель в Хургаде, Египет",
    //                           adress: "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
    //                           minimalPrice: 200000,
    //                           priceForIt: "Все включено",
    //                           rating: 5,
    //                           ratingName: "Превохдодн",
    //                           imageUrls: ["https://www.tourdom.ru/upload/iblock/660/660d38b83f5a0f8985003dbe89584d6a.jpg", "https://princeparkhotel.ru/upload/resize_cache/iblock/532/1900_840_2/5325923d49888f7962d0d1abefcbe38d.jpg", "https://cdn.ostrovok.ru/t/640x400/extranet/8a/2b/8a2b0372d32cdd92db77eb31a44794ed686f974e.png"],
    //                           aboutTheHotel: AboutTheHotel(description: "Новый отель на береговой линии", peculiarities: ["Первая береговая линия", "Кондиционер", "Парковка", "Беспроводной интернет"]))
    //    }
    
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


