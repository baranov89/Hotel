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
            Button { } label: {
                HStack{
                    Image("emoji-happy")
                    VStack(alignment: .leading) {
                        Text("Удобства")
                            .font(.system(size: 16, weight: .medium))
                            .multilineTextAlignment(.leading)
                        Text("Самое необходиме")
                            .font(.system(size: 14, weight: .medium))
                            .multilineTextAlignment(.leading).opacity(0.5)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }
            .foregroundColor(.black)
            Divider()
            Button { } label: {
                HStack{
                    Image("tick-square")
                    VStack(alignment: .leading) {
                        Text("Что вулючено")
                            .font(.system(size: 16, weight: .medium))
                            .multilineTextAlignment(.leading)
                        Text("Самое необходиме")
                            .font(.system(size: 14, weight: .medium))
                            .multilineTextAlignment(.leading).opacity(0.5)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }
            .foregroundColor(.black)
            Divider()
            Button { } label: {
                HStack{
                    Image("close-square")
                    VStack(alignment: .leading) {
                        Text("Что не включено")
                            .font(.system(size: 16, weight: .medium))
                            .multilineTextAlignment(.leading)
                        Text("Самое необходиме")
                            .font(.system(size: 14, weight: .medium))
                            .multilineTextAlignment(.leading).opacity(0.5)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }
            .foregroundColor(.black)
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
