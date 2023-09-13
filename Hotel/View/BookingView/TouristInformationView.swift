//
//  TouristInformationView.swift
//  Hotel
//
//  Created by Алексей Баранов on 11.09.2023.
//

import SwiftUI

struct TouristInformationView: View {
    @StateObject var vm = TouristInformationViewModel()
    
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
                            TouristInformationItemView(text: "Имя", linkToData: $tourist.name)
                            TouristInformationItemView(text: "Фамилия", linkToData: $tourist.LastName)
                            TouristInformationItemView(text: "Дата рождения", linkToData: $tourist.DateOfBirth)
                            TouristInformationItemView(text: "Гражданство", linkToData: $tourist.citizenship)
                            TouristInformationItemView(text: "Номер загран паспорта", linkToData: $tourist.passportNumber)
                            TouristInformationItemView(text: "Срок действия загран паспорта", linkToData: $tourist.passportValidityPeriod)
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
        TouristInformationView()
    }
}
