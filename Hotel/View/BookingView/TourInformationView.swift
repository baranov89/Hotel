//
//  TourInformationView.swift
//  Hotel
//
//  Created by Алексей Баранов on 11.09.2023.
//

import SwiftUI

struct TourInformationView: View {
    var vm: BookingViewModel
    var roomName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let bookingDetails = vm.bookingDetails {
                TourInformationItemView(key: "Вылет из", value: bookingDetails.departure, alignment: .leading)
                TourInformationItemView(key: "Старнв, город", value: bookingDetails.arrivalCountry, alignment: .leading)
                TourInformationItemView(key: "Дата", value: "\(bookingDetails.tourDateStart) - \(bookingDetails.tourDateStop)", alignment: .leading)
                TourInformationItemView(key: "Кол-во ночей", value: "\(bookingDetails.numberOfNights)", alignment: .leading)
                TourInformationItemView(key: "Отель", value: bookingDetails.hotelName, alignment: .leading)
                TourInformationItemView(key: "Номер", value: roomName, alignment: .leading)
                TourInformationItemView(key: "Питание", value: bookingDetails.nutrition, alignment: .leading)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.white)
        .cornerRadius(12)
    }
}

struct TourInformationView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = BookingViewModel()
        TourInformationView(vm: vm, roomName: "asda")
    }
}
