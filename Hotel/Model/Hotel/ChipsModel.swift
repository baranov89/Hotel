//
//  ChipsModel.swift
//  Hotel
//
//  Created by Алексей Баранов on 10.09.2023.
//

import Foundation

struct ChipsModel: Identifiable {
    var id = UUID().uuidString
    var chipsText: String
    var isExceeded = false
}
