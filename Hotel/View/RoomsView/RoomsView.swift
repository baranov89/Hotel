//
//  NumberView.swift
//  Hotel
//
//  Created by Алексей Баранов on 08.09.2023.
//

import SwiftUI

struct RoomsView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var vm = RoomsViewModel()
    @State var roomName: String = ""
//    var hotelName: String
    var body: some View {
        ZStack{
            Color.gray.opacity(0.2)
                .ignoresSafeArea(edges: .bottom)
            ScrollView(showsIndicators: false) {
                VStack{
                    if let numbers = vm.numbers {
                        VStack(spacing: 10) {
                            ForEach(numbers.rooms) { room in
                                VStack(alignment: .leading){
                                    CaruselView(urlPhoto: room.imageUrls )
                                    NameView(name: room.name)
                                    TagsView(data: room.peculiarities)
                                    Button { } label: {
                                        HStack {
                                            Text("Подробнее о номере" )
                                                .font(.system(size: 16, design: .rounded).bold())
                                                .frame( alignment: .leading)
                                                .font(.system(size: 16, weight: .medium))
                                                .foregroundColor(Color(hex: 0x0D72FF, alpha: 1))
                                            Image(systemName: "chevron.right")
                                        }
                                        .padding(.horizontal, 5)
                                    }
                                    .padding(5)
                                    .frame(alignment: .leading)
                                    .background(Color(hex: 0x0D72FF, alpha: 0.1))
                                    .cornerRadius(10)
                                    PriceView(price: room.price)
                                    Button {
                                        roomName = room.name
                                        coordinator.goBooking(room: roomName)
                                    } label: {
                                        Text("Выбрать номмер")
                                            .font(.system(size: 16, weight: .regular))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 50)
                                            .background(.blue)
                                            .cornerRadius(20)
                                            .padding(.top)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .background(.white)
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding()
                                .background(.white)
                                .cornerRadius(20)
                            }
                            
                        }
                        .padding(.top, 10)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.automatic)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(coordinator.hotelName ?? "sdasd")
                    .font(.system(size: 18)).fontWeight(.medium)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .task {
            await vm.fetchHNumbers()
        }
    }
}

//struct NumberView_Previews: PreviewProvider {
//    static var previews: some View {
//        RoomsView(hotelName: "asdasd")
//    }
//}
