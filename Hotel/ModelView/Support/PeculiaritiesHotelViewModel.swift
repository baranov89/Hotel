//
//  PeculiaritiesHotelViewModel.swift
//  Hotel
//
//  Created by Алексей Баранов on 10.09.2023.
//

import Foundation
import SwiftUI

class PeculiaritiesHotelViewModel: ObservableObject {
    @Published var chips: [[ChipsModel]] = [[]]
    var array: [String]
    
    init(array: [String]) {
        self.array = array
        getChips()
    }
    
    func getChips() {
        let filteredArray = array.sorted(by: {$0 < $1})
        for text in filteredArray {
            self.chips[0].append(ChipsModel(chipsText: text))
        }
    }
}
