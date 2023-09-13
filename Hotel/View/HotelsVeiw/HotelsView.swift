//
//  HotelView.swift
//  Hotel
//
//  Created by Алексей Баранов on 06.09.2023.
//

import SwiftUI

struct HotelsView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var vm = HotelViewModel()
    @State private var triger = false
    
    var body: some View {
        VStack {
            if let hotel = vm.hotel {
                ScrollView(showsIndicators: false) {
                    VStack {
                        VStack(alignment: .leading) {
                            CaruselView(urlPhoto: hotel.imageUrls )
                            RatingView(rating: hotel.rating, ratingDescription: hotel.ratingName)
                            NameView(name: hotel.name)
                            AdressView(adress: hotel.adress)
                            PriceView(price: hotel.minimalPrice)
                        }
                        .padding(.bottom)
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                        VStack{
                            Text("Об отеле")
                                .font(.system(size: 22, design: .rounded).bold())
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 5)
                            TagsView(data: hotel.aboutTheHotel.peculiarities)
                            HStack {
                                Text(hotel.aboutTheHotel.description)
                                    .frame(alignment: .leading)
                            }
                            HotelDetailsView()
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.white)
                        .cornerRadius(20)
                        Button { coordinator.goRomms(hotelName: hotel.name) } label: {
                            Text("К выбору номера")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(.blue)
                                .cornerRadius(20)
                                .padding(.horizontal)
                                .padding(.top)
                        }
                        .frame(maxWidth: .infinity)
                        .background(.white)
                    }
                    .background(.gray.opacity(0.2))
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Отель")
                    .font(.system(size: 18)).fontWeight(.medium)
            }
        }
        .task {
            await vm.fetchHotels()
        }
    }
}



struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct HotelView_Previews: PreviewProvider {
    static var previews: some View {
        HotelsView()
    }
}
