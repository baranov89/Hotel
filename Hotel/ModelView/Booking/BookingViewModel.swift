//
//  BookingViewModel.swift
//  Hotel
//
//  Created by Алексей Баранов on 11.09.2023.
//

import Foundation

class BookingViewModel: ObservableObject {
    @Published var bookingDetails: BookingModel?
    private let client = NetworkManager.instance
    var fulPrice: String {
        return String(bookingDetails?.serviceCharge ?? 0 + (bookingDetails?.fuelCharge ?? 0)  + (bookingDetails?.tourPrice ?? 0))
    }
    
    var request: URLRequest = {
        let urlString = "https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8"
        let url = URL(string: urlString)!
        return URLRequest(url: url)
    }()
    
    func fetchBookingDetails() async {
        let response = await client.fetch(type: BookingModel.self, with: request)
        switch response {
        case .success(let success):
            Task { @MainActor in
                bookingDetails = success
            }
        case .failure(let failure):
            print(failure.localizedDescription)
        }
    }
}
