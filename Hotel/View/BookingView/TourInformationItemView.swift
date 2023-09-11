//
//  TourInformationItemView.swift
//  Hotel
//
//  Created by Алексей Баранов on 11.09.2023.
//

import SwiftUI

struct TourInformationItemView: View {
    var key: String
    var value: String
    var alignment: Alignment
    
    var body: some View {
        HStack {
            Text(key)
                .frame(width: UIScreen.main.bounds.width/2 - 40, alignment: .leading)
                .foregroundColor(Color(hex: 0x828796))
            Text(value)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: alignment)
        }
        .frame(maxWidth: .infinity)
        .font(.system(size: 16))
    }
}

struct TourInformationItemView_Previews: PreviewProvider {
    static var previews: some View {
        TourInformationItemView(key: "asd", value: "asd", alignment: .leading)
    }
}
