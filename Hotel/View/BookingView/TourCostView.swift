//
//  TourCostView.swift
//  Hotel
//
//  Created by Алексей Баранов on 11.09.2023.
//

import SwiftUI

struct TourCostView: View {
    var vm: BookingViewModel
    var body: some View {
        if let bookingDetails = vm.bookingDetails {
            VStack(alignment: .leading, spacing: 10) {
                TourInformationItemView(key: "Тур", value: String(bookingDetails.tourPrice), alignment: .trailing)
                TourInformationItemView(key: "Топливный сбор", value: String(bookingDetails.fuelCharge), alignment: .trailing)
                TourInformationItemView(key: "Сервисный сбор", value: String(bookingDetails.serviceCharge), alignment: .trailing)
                TourInformationItemView(key: "К оплате", value: String(vm.fullPrice ?? 0), alignment: .trailing)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.white)
            .cornerRadius(12)
        }
    }
}

struct TourCostView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = BookingViewModel()
        TourCostView(vm: vm)
    }
}
