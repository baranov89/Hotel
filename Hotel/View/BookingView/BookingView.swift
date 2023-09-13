//
//  BookingView.swift
//  Hotel
//
//  Created by Алексей Баранов on 11.09.2023.
//

import SwiftUI

struct BookingView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var vm = BookingViewModel()
    @State var isValid = true
    
    var body: some View {
        ScrollView {
            if let bookingDatails = vm.bookingDetails {
                VStack {
                    VStack(alignment: .leading) {
                        RatingView(rating: bookingDatails.horating, ratingDescription: bookingDatails.ratingName)
                        NameView(name: bookingDatails.hotelName)
                        AdressView(adress: bookingDatails.hotelAdress)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.white)
                    .cornerRadius(12)
                    TourInformationView(vm: vm, roomName: coordinator.room ?? "asdasd")
                    BuyerInformationView()
                    TouristInformationView(data: vm, isValid: $isValid)
                    TourCostView(vm: vm)
                    Button {
                        if let tourist = vm.tourist.first {
                            isValid = true
                            if tourist.name != "" && tourist.LastName != "" && tourist.DateOfBirth != "" && tourist.passportNumber != "" && tourist.citizenship != "" && tourist.passportValidityPeriod != "" {
                                coordinator.goPayment()
                            } else {
                                isValid = false
                            }
                        }
                    } label: {
                        Text("Оплатить \(vm.fullPrice ?? 0)")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(.blue)
                            .cornerRadius(14)
                            .padding(.horizontal)
                            .padding(.top)
                    }
                    .frame(maxWidth: .infinity)
                    .background(.white)
                }
                .background(.gray.opacity(0.2))
                .padding(.top, 10)
            }
        }
        .task {
            await vm.fetchBookingDetails()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Бронирование")
                    .font(.system(size: 18)).fontWeight(.medium)
            }
        }
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
