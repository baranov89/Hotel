//
//  Coordinator.swift
//  Hotel
//
//  Created by Алексей Баранов on 12.09.2023.
//

import Foundation
import SwiftUI

@MainActor
final class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var hotelName: String?
    @Published var room: String?
    
    func goHotel() {
        path.removeLast(path.count)
    }
    
    func goRomms(hotelName: String) {
        self.hotelName = hotelName
        path.append(MyPages.rooms)
    }
    
    func goBooking(room: String) {
        self.room = room
        path.append(MyPages.booking)
    }
    
    func goPayment() {
        path.append(MyPages.payment)
    }
    
    @ViewBuilder
    func getPage(page: MyPages) -> some View {
        switch page {
        case .hotel :
            HotelsView()
        case .rooms:
            RoomsView()
        case .booking:
            BookingView()
        case .payment:
            PaymentView()
        }
    }
}


