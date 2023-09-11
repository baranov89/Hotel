//
//  TouristInformationItemView.swift
//  Hotel
//
//  Created by Алексей Баранов on 11.09.2023.
//

import SwiftUI

struct TouristInformationItemView: View {
    var text: String
    @Binding var linkToData: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if !linkToData.isEmpty {
                Text(text)
                    .foregroundColor(Color(hex: 0xA9ABB7))
                    .font(.system(size: 12))
            }
            TextField(text, text: $linkToData)
                .foregroundColor(.black)
                .font(.system(size: 16))
        }
        .grayTextField()
    }
}

struct TouristInformationItemView_Previews: PreviewProvider {
    static var previews: some View {
        TouristInformationItemView(text: "Имя", linkToData: .constant("Иван"))
    }
}
