//
//  PeculiaritiesHotelView.swift
//  Hotel
//
//  Created by Алексей Баранов on 07.09.2023.
//

import SwiftUI

struct PeculiaritiesHotelView: View {
    @State var chips: [[ChipsModel]] = []
    var peculiarities: [String]
    
    var body: some View {
        VStack {
            ForEach(chips.indices, id: \.self) { index in
                HStack {
                    ForEach(chips[index].indices, id: \.self) { chipIndex in
                        Text(chips[index][chipIndex].chipsText)
                            .font(.system(size: 15))
                            .padding(.horizontal, 5)
                            .padding(.vertical, 5)
                            .background(.gray.opacity(0.1))
                            .cornerRadius(5)
                            .lineLimit(1)
                            .overlay(
                                GeometryReader{ reader -> Color in
                                    let maxX = reader.frame(in: .global).maxX
                                    if maxX > UIScreen.main.bounds.width - 30 && !chips[index][chipIndex].isExceeded {
                                        DispatchQueue.main.async {
                                            chips[index][chipIndex].isExceeded = true
                                            let lastItem = chips[index][chipIndex]
                                            chips.append([lastItem])
                                            chips[index].remove(at: chipIndex)
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
        .onAppear{
            let filteredArray = peculiarities.sorted(by: {$0 < $1})
            for text in filteredArray {
                addText(text: text)
            }
        }
    }
    
    func addText(text: String) {
        if chips.isEmpty {
            chips.append([])
        }
        chips[chips.count - 1].append(ChipsModel(chipsText: text))
    }
}

struct ChipsModel: Identifiable {
    var id = UUID().uuidString
    var chipsText: String
    var isExceeded = false
}

struct PeculiaritiesHotelView_Previews: PreviewProvider {
    static var previews: some View {
        PeculiaritiesHotelView(peculiarities: [""])
    }
}
