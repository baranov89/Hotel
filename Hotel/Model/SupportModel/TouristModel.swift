//
//  TouristModel.swift
//  Hotel
//
//  Created by Алексей Баранов on 11.09.2023.
//

import Foundation

struct TouristModel: Identifiable {
    var id = UUID().uuidString
    var titleName: String
    var isOpen: Bool
    var name: String
    var LastName: String
    var DateOfBirth: String
    var citizenship: String
    var passportNumber: String
    var passportValidityPeriod: String 
}
