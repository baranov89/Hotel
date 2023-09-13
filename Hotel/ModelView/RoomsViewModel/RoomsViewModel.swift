//
//  NumberViewModel.swift
//  Hotel
//
//  Created by Алексей Баранов on 08.09.2023.
//

import Foundation
import SwiftUI

class RoomsViewModel: ObservableObject {
    @Published private(set) var rooms: RoomModel?
    private let client = NetworkManager.instance
    
    init() {
        rooms = RoomModel(rooms: [
        Room(id: 1,
             name: "Стандартный с видом на парковку",
             price: 123876,
             pricePer: "не понятно че это",
             peculiarities: ["Кондиционер", "3 местра", "Две кровати", "Парковка возле номера"],
             imageUrls: ["https://vedenskyhotel.ru/wp-content/uploads/2017/11/00006standart_room_vedensky-2.jpg", "https://panoramacity.ru/wp-content/uploads/2020/07/3V9A6982.jpg", "https://www.president-hotel.ru/upload/iblock/a3e/a3e904fead2f3c8178bdff7e284b3aaf.jpg"]),
        Room(id: 2,
             name: "Люкс с видом на море",
             price: 232412,
             pricePer: "не понятно че это",
             peculiarities: ["Джакузи в номере", "Кондиционер", "3 местра", "Парковка возле номера"],
             imageUrls: ["https://kazanriviera.ru/upload/resize_cache/iblock/bdd/960_500_2/2080ft6upbxaymk9quzgin07t3dn5avx.jpg", "https://anapa-grand-hotel.ru/assets/images/site/nomera/standart.jpg", "https://skypoint-hotel.ru/wp-content/uploads/2023/05/1477936610_no_crop.jpg"])
        ])
    }
    
    var request: URLRequest = {
        let urlString = "https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd"
        let url = URL(string: urlString)!
        return URLRequest(url: url)
    }()
    
    func fetchHNumbers() async {
        let response = await client.fetch(type: RoomModel.self, with: request)
        switch response {
        case .success(let success):
            Task { @MainActor in
//                numbers = success
            }
        case .failure(let failure):
            print(failure.localizedDescription)
        }
    }
}
