//
//  MyPages.swift
//  Hotel
//
//  Created by Алексей Баранов on 12.09.2023.
//

import Foundation

enum MyPages: String, CaseIterable, Identifiable {
    case hotel, rooms, booking, payment
    var id: String {
        self.rawValue
    }
}
