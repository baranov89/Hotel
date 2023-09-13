//
//  BookingViewModel.swift
//  Hotel
//
//  Created by Алексей Баранов on 11.09.2023.
//

import Foundation

class BookingViewModel: ObservableObject {
    @Published var bookingDetails: BookingModel?
    @Published var tourist: [TouristModel] = [TouristModel(titleName: "Первый турист",
                                                           isOpen: true,
                                                           name: "",
                                                           LastName: "",
                                                           DateOfBirth: "",
                                                           citizenship: "",
                                                           passportNumber: "",
                                                           passportValidityPeriod: "")]
    private let client = NetworkManager.instance
    var fullPrice: Int?
    private var array: [String] = ["Первый турист", "Второй турист", "Третий турист", "Четвертый турист", "Пятый турист"]
    
    // if API doesn't work
    
    //    init() {
    //        bookingDetails = BookingModel(id: 1,
    //                                      hotelName: "Лучший пятизвездочный отель в Хургаде, Египет",
    //                                      hotelAdress: "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
    //                                      horating: 5,
    //                                      ratingName: "Превосходно",
    //                                      departure: "Турция",
    //                                      arrivalCountry: "Россия",
    //                                      tourDateStart: "22.09.2023",
    //                                      tourDateStop: "29.09.2023",
    //                                      numberOfNights: 7,
    //                                      room: "Стандартный",
    //                                      nutrition: "Все включено",
    //                                      tourPrice: 234576,
    //                                      fuelCharge: 2098,
    //                                      serviceCharge: 4789)
    //        getFullPrice()
    //    }
    
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
                getFullPrice()
            }
        case .failure(let failure):
            print(failure.localizedDescription)
        }
    }
    
    func getFullPrice() {
        fullPrice = (bookingDetails?.serviceCharge ?? 0) + (bookingDetails?.fuelCharge ?? 0)  + (bookingDetails?.tourPrice ?? 0)
    }
    
    func addtourist() {
        tourist.append(TouristModel(titleName: array[tourist.count],
                                    isOpen: false,
                                    name: "",
                                    LastName: "",
                                    DateOfBirth: "",
                                    citizenship: "",
                                    passportNumber: "",
                                    passportValidityPeriod: ""))
    }
}
