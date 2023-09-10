//
//  NameView.swift
//  Hotel
//
//  Created by Алексей Баранов on 10.09.2023.
//

import SwiftUI

struct NameView: View {
    var name: String
    
    var body: some View {
        HStack{
            Text(name)
                .font(.system(size: 22, weight: .regular))
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 2)
        }
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView(name: "asdassadfsdfsasdfsdfsdfsdf             sdfsdfsdfd")
    }
}
