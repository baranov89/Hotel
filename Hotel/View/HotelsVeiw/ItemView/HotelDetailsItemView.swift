//
//  HotrlDetailsItemView.swift
//  Hotel
//
//  Created by Алексей Баранов on 12.09.2023.
//

import SwiftUI

struct HotelDetailsItemView: View {
    var image: String
    var title: String
    var text: String
    
    var body: some View {
        Button { } label: {
            HStack{
                Image(image)
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 16, weight: .medium))
                        .multilineTextAlignment(.leading)
                    Text(text)
                        .font(.system(size: 14, weight: .medium))
                        .multilineTextAlignment(.leading).opacity(0.5)
                }
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
        .foregroundColor(.black)
    }
}

//struct HotrlDetailsItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        HotrlDetailsItemView()
//    }
//}
