//
//  BasicData.swift
//  Hotel
//
//  Created by Алексей Баранов on 06.09.2023.
//

import SwiftUI

struct BasicData: View {
    var adress: String
    var price: Int
    
    var body: some View {
        Button { } label: {
            Text(adress)
                .multilineTextAlignment(.leading)
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        HStack {
            Text("от \(price)")
                .font(.system(size: 30, design: .rounded).bold())
                .frame(height: 30)
            Image(systemName: "rublesign")
                .font(.system(size: 24, design: .rounded).bold())
                .frame(height: 30)
            Text("за тур с перелетом")
                .foregroundColor(Color(red: 130/255, green: 135/255, blue: 150/255))
                .font(.system(size: 16, design: .rounded))
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 30)
        .padding(.leading)
    }
}

struct BasicData_Previews: PreviewProvider {
    static var previews: some View {
        BasicData(adress: "sdasd", price: 12)
    }
}
