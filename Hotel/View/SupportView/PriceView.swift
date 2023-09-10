//
//  PriceView.swift
//  Hotel
//
//  Created by Алексей Баранов on 10.09.2023.
//

import SwiftUI

struct PriceView: View {
    var price: Int
    
    var body: some View {
        HStack {
            Text("от \(price)")
                .font(.system(size: 30, design: .rounded).bold())
                .frame(height: 30)
            Image(systemName: "rublesign")
                .font(.system(size: 24, design: .rounded).bold())
                .frame(height: 30)
            Text("за тур с перелетом")
                .foregroundColor(Color(hex: 0x828796, alpha: 1.0))
                .font(.system(size: 16, design: .rounded))
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
//        .frame(maxWidth: .infinity)
        .frame(height: 30)
//        .padding(.leading)
    }
}
