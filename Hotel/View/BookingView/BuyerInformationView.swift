//
//  BuyerInformationView.swift
//  Hotel
//
//  Created by Алексей Баранов on 11.09.2023.
//

import SwiftUI

struct BuyerInformationView: View {
    @StateObject var vm = BuyerInformationViewModel()
    @FocusState var focusedField: Field?
//    var data = Binding(
//        get: {self.data + "*******" },
//        set: {self.data = $0 }
//    )

    var body: some View {
      
        VStack(alignment: .leading) {
                Text("Информация о покупателе")
                    .font(.system(size: 22))
            VStack(alignment: .leading, spacing: 0) {
                if !vm.phone.isEmpty {
                    Text("телефон")
                        .foregroundColor(Color(hex: 0xA9ABB7))
                        .font(.system(size: 12))
                }
                TextField("+7 (***) *** - ** - **", text: $vm.phone)
                    .onChange(of: vm.phone, perform: { _ in
                        DispatchQueue.main.async {
                            vm.phone = vm.phone.formattedMask(text: vm.phone, mask: "+X (XXX) XXX-XX-XX")
                        }
                    })
                    .focused($focusedField, equals: Field.phone)
                    .foregroundColor(.black)
                    .font(.system(size: 16))
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .background(vm.phone != "" && focusedField != .phone && !vm.isValidPhone ? .red.opacity(0.1) : Color(hex: 0xF6F6F9))
            .cornerRadius(10)
            VStack(alignment: .leading, spacing: 0) {
                if !vm.email.isEmpty {
                    Text("Почта")
                        .foregroundColor(Color(hex: 0xA9ABB7))
                        .font(.system(size: 12))
                }
                TextField("a.baranov89@mail.ru", text: $vm.email)

                    .focused($focusedField, equals: Field.email)
                    .foregroundColor(.black)
                    .font(.system(size: 16))
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .background(vm.email != "" && focusedField != .email && !vm.isValidEmail ? .red.opacity(0.1) : Color(hex: 0xF6F6F9))
            .cornerRadius(10)
//            TouristInformationItemView(text: "Номер телефона", linkToData: $vm.phone)
//            TouristInformationItemView(text: "Почта", linkToData: $vm.email)
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

//struct BuyerInformationView_Previews: PreviewProvider {
//    static var previews: some View {
//        BuyerInformationView()
//    }
//}

enum Field: Hashable {
    case phone
    case email
}
