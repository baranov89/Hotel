//
//  String+extension.swift
//  Hotel
//
//  Created by Алексей Баранов on 13.09.2023.
//

import Foundation

extension String {
    func formattedMask(mask: String?) -> String {
        if mask == nil {
            return self
        }
        let cleanPhoneNumber = self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        var result = ""
        var index = cleanPhoneNumber.startIndex
        if let mask = mask {
            for ch in mask where index < cleanPhoneNumber.endIndex {
                if ch == "X" {
                    result.append(cleanPhoneNumber[index])
                    index = cleanPhoneNumber.index(after: index)
                } else {
                    result.append(ch)
                }
            }
        }
        return result
    }
}
