//
//  BasicData.swift
//  Hotel
//
//  Created by Алексей Баранов on 06.09.2023.
//

import SwiftUI

struct AdressView: View {
    var adress: String
    var price: Int
    
    var body: some View {
        Button { } label: {
            Text(adress)
                .multilineTextAlignment(.leading)
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct BasicData_Previews: PreviewProvider {
    static var previews: some View {
        AdressView(adress: "sdasd", price: 12)
    }
}
