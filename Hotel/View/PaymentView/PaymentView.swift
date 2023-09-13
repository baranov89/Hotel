//
//  PaymentView.swift
//  Hotel
//
//  Created by Алексей Баранов on 12.09.2023.
//

import SwiftUI

struct PaymentView: View {
    @EnvironmentObject var coordinator: Coordinator
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Image("Party_Popper")
                    .resizable()
                    .frame(width: 44, height: 44)
            }
            .frame(width: 94, height: 94)
            .background(Color(hex: 0xF6F6F9))
            .cornerRadius(47)
            Text("Ваш заказ принят в работу")
                .font(.system(size: 22)).fontWeight(.medium)
                .padding(.top)
            Text("Подтверждение заказа №\(Int.random(in: 100000 ... 999999)) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление")
                .font(.system(size: 16))
                .foregroundColor(Color(hex: 0x828796))
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            Button { coordinator.goHotel() } label: {
                Text("Супер!")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.blue)
                    .cornerRadius(14)
                    .padding(.horizontal)
                    .padding(.top)
            }
            .frame(maxWidth: .infinity)
            .background(.white)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Заказ оплачен")
                    .font(.system(size: 18)).fontWeight(.medium)
            }
        }
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
