//
//  HotelDetailsView.swift
//  Hotel
//
//  Created by Алексей Баранов on 07.09.2023.
//

import SwiftUI

struct HotelDetailsView: View {
    
    var body: some View {
        VStack{
            HotelDetailsItemView(image: "emoji-happy", title: "Удобства", text: "Самое необходиме")
            Divider()
            HotelDetailsItemView(image: "tick-square", title: "Что вулючено", text: "Самое необходиме")
            Divider()
            HotelDetailsItemView(image: "tick-square", title: "Что вулючено", text: "Самое необходиме")
        }
        .padding(.horizontal, 5)
        .padding()
        .background(.gray.opacity(0.2))
        .cornerRadius(20)
    }
}

struct HotelDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        HotelDetailsView()
    }
}
