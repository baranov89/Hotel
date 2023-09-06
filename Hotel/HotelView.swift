//
//  HotelView.swift
//  Hotel
//
//  Created by Алексей Баранов on 06.09.2023.
//

import SwiftUI

struct HotelView: View {
    @StateObject var vm = HotelViewModel()
    var body: some View {
        Text(vm.hotels.first?.name ?? "error")
            .task {
                await vm.fetchHotels()
            }
    }
}

struct HotelView_Previews: PreviewProvider {
    static var previews: some View {
        HotelView(vm: HotelViewModel())
    }
}
