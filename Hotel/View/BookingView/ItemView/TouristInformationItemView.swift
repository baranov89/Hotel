//
//  TouristInformationItemView.swift
//  Hotel
//
//  Created by Алексей Баранов on 11.09.2023.
//

import SwiftUI

struct TouristInformationItemView: View {
    @Binding var linkToData: String
    @Binding var isValid: Bool
    var text: String
    var mask: String?
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if !linkToData.isEmpty {
                Text(text)
                    .foregroundColor(Color(hex: 0xA9ABB7))
                    .font(.system(size: 12))
            }
            TextField(text, text: $linkToData)
                .onChange(of: linkToData, perform: { _ in
                    DispatchQueue.main.async {
                        linkToData = linkToData.formattedMask(mask: mask)
                    }
                })
                .foregroundColor(.black)
                .font(.system(size: 16))
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .background((linkToData == "" && !isValid) ? .red.opacity(0.1) : Color(hex: 0xF6F6F9))
        .cornerRadius(10)
    }
}

struct TouristInformationItemView_Previews: PreviewProvider {
    static var previews: some View {
        TouristInformationItemView(linkToData: .constant("Данные"), isValid: .constant(false), text: "телефон")
    }
}
