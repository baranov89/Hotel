//
//  TouristInformationViewModel.swift
//  Hotel
//
//  Created by Алексей Баранов on 11.09.2023.
//

import Foundation
import SwiftUI

class TouristInformationViewModel: ObservableObject {
    
    @Published var tourist: [TouristModel] = [TouristModel(titleName: "Первый турист", isOpen: true)]
    private var array: [String] = [
        "Первый турист",
        "Второй турист",
        "Третий турист",
        "Четвертый турист",
        "Пятый турист"]
    
    func addtourist() {
        tourist.append(TouristModel(titleName: array[tourist.count], isOpen: false))
    }
}
