//
//  HotelView.swift
//  Hotel
//
//  Created by Алексей Баранов on 06.09.2023.
//

import SwiftUI

struct HotelView: View {
    @StateObject private var vm = HotelViewModel()
    
    var body: some View {
        NavigationStack {
            if let hotel = vm.hotel {
                ScrollView(showsIndicators: false){
                    VStack {
                        VStack {
                            Text("Отель")
                                .font(.system(size: 22, design: .rounded))
                            CaruselPhotoView(urlPhoto: hotel.imageUrls )
                                .frame(width: UIScreen.main.bounds.width - 32, height: 245)
                                .cornerRadius(15)
                            RatingView(rating: hotel.rating, ratingDescription: hotel.ratingName)
                            HStack {
                                Text(hotel.name)
                                    .font(.system(size: 22, weight: .regular))
                                Spacer()
                            }
                            .padding(.leading)
                            BasicData(adress: hotel.adress, price: hotel.minimalPrice)
                        }
                        .padding(.bottom)
                        .background(.white)
                        .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                        .ignoresSafeArea(edges: [.top])
                        VStack{
                            Text("Об отеле")
                                .font(.system(size: 22, design: .rounded).bold())
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                            PeculiaritiesHotelView(peculiarities: hotel.aboutTheHotel.peculiarities)
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
                        Spacer()
                        Button { } label: {
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
                    .ignoresSafeArea(edges: [.bottom])
                    .background(.gray.opacity(0.2))
                }
            }
        }
        .task {
            await vm.fetchHotels()
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
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
        HotelView()
    }
}
