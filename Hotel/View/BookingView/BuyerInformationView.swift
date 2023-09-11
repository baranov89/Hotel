//
//  BuyerInformationView.swift
//  Hotel
//
//  Created by Алексей Баранов on 11.09.2023.
//

import SwiftUI

struct BuyerInformationView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Информация о покупателе")
                .font(.system(size: 22))
            VStack(alignment: .leading) {
                Text("Номер телефона")
                    .foregroundColor(Color(hex: 0xA9ABB7))
                    .font(.system(size: 12))
                Text("+7 (951) 555-99-00")
                    .foregroundColor(.black)
                    .font(.system(size: 16))
            }
            .grayTextField()
            VStack(alignment: .leading) {
                Text("Почта")
                    .foregroundColor(Color(hex: 0xA9ABB7))
                    .font(.system(size: 12))
                Text("a.baranov89@mailru")
                    .foregroundColor(.black)
                    .font(.system(size: 16))
            }
            .grayTextField()
            Text("Эти данные никому не передаються. Псле оплаты мы вышли на указанный вам номер и почту.")
                .font(.system(size: 14))
                .foregroundColor(Color(hex: 0x828796))
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.white)
        .cornerRadius(12)
    }
}

struct BuyerInformationView_Previews: PreviewProvider {
    static var previews: some View {
        BuyerInformationView()
    }
}
