//
//  TouristInformationView.swift
//  Hotel
//
//  Created by Алексей Баранов on 11.09.2023.
//

import SwiftUI

struct TouristInformationView: View {
    @StateObject var vm: BookingViewModel
    @Binding var isValid: Bool
    
    init(data: BookingViewModel, isValid: Binding<Bool>)
    {
        self._vm = StateObject(wrappedValue: data)
        self._isValid = Binding(projectedValue: isValid)
    }
    
    var body: some View {
        VStack {
            ForEach($vm.tourist) { $tourist in
                VStack{
                    Button {
                        withAnimation(.default) {
                            tourist.isOpen.toggle()
                        }
                    } label: {
                        HStack {
                            Text(tourist.titleName)
                                .font(.system(size: 22))
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName:  "chevron.down")
                                .rotationEffect(.degrees(tourist.isOpen ? 180 : 360))
                                .foregroundColor(.blue)
                                .frame(width: 24, height: 24)
                                .background(Color(hex: 0xD3E5F5))
                                .cornerRadius(6)
                        }
                    }
                    if tourist.isOpen {
                        VStack {
                            TouristInformationItemView(linkToData: $tourist.name, isValid: $isValid, text: "Имя")
                            TouristInformationItemView(linkToData: $tourist.LastName, isValid: $isValid, text: "Фамилия")
                            TouristInformationItemView(linkToData: $tourist.DateOfBirth, isValid: $isValid, text: "Дата рождения", mask: "XX.XX.XXXX")
                            TouristInformationItemView(linkToData: $tourist.citizenship, isValid: $isValid, text: "Гражданство")
                            TouristInformationItemView(linkToData: $tourist.passportNumber, isValid: $isValid, text: "Номер загран паспорта", mask: "XXXX-XXXX")
                            TouristInformationItemView(linkToData: $tourist.passportValidityPeriod, isValid: $isValid, text: "Срок действия загран паспорта", mask: "XX.XX.XXXX")
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.white)
                .cornerRadius(12)
            }
            Button { vm.addtourist() } label: {
                HStack {
                    Text("Добавить")
                        .font(.system(size: 22))
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24)
                        .background(Color(hex: 0x0D72FF, alpha: 1))
                        .cornerRadius(6)
                }
                .animation(nil, value:  UUID())
            }
            .frame(height: 58)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .background(.white)
            .cornerRadius(10)
        }
    }
}

struct TouristInformationView_Previews: PreviewProvider {
    static var previews: some View {
        TouristInformationView(data: BookingViewModel(), isValid: .constant(false))
    }
}
