//
//  PeculiaritiesHotelView.swift
//  Hotel
//
//  Created by Алексей Баранов on 07.09.2023.
//

import SwiftUI

struct PeculiaritiesHotelView: View {
    @StateObject var vm: PeculiaritiesHotelViewModel
    init(data: [String]) {
        self._vm = StateObject(wrappedValue: PeculiaritiesHotelViewModel(array: data))
    }
    
    var body: some View {
        VStack {
            ForEach(vm.chips.indices, id: \.self) { index in
                HStack {
                    ForEach(vm.chips[index].indices, id: \.self) { chipIndex in
                        Text(vm.chips[index][chipIndex].chipsText)
                            .font(.system(size: 15))
                            .padding(.horizontal, 5)
                            .padding(.vertical, 5)
                            .background(.gray.opacity(0.1))
                            .cornerRadius(5)
                            .lineLimit(1)
                            .overlay(
                                GeometryReader{ reader -> Color in
                                    let maxX = reader.frame(in: .global).maxX
                                    if maxX > UIScreen.main.bounds.width - 30 && !vm.chips[index][chipIndex].isExceeded {
                                        DispatchQueue.main.async {
                                            vm.chips[index][chipIndex].isExceeded = true
                                            let lastItem = vm.chips[index][chipIndex]
                                            vm.chips.append([lastItem])
                                            vm.chips[index].remove(at: chipIndex)
                                        }
                                    }
                                    return Color.clear
                                }
                            )
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(width: UIScreen.main.bounds.width - 36, alignment: .leading)
    }
}



//struct PeculiaritiesHotelView_Previews: PreviewProvider {
//    static var previews: some View {
//        PeculiaritiesHotelView(chips: .constant([[ChipsModel(chipsText: "asdasd"), ChipsModel(chipsText: "asdasd"), ChipsModel(chipsText: "asdasd"), ChipsModel(chipsText: "asdasd")]]))
//    }
//}
