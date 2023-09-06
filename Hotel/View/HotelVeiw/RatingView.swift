//
//  RatingView.swift
//  Hotel
//
//  Created by Алексей Баранов on 06.09.2023.
//

import SwiftUI

struct RatingView: View {
    var rating: Int
    var ratingDescription: String
    
    var body: some View {
        HStack {
            HStack{
                Image(systemName: "star.fill")
                Text(String(rating ))
                Text(ratingDescription )
            }
            .foregroundColor(Color(hex: 0xFFA800))
            .padding(8)
            .background(Color(hex: 0xFFC700, alpha: 0.2))
            .cornerRadius(5)
            Spacer()
        }
        .padding(.leading)
        .padding(.top)
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 0, ratingDescription: "asd")
    }
}
	
