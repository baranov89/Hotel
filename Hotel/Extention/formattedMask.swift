//
//  formattedMask.swift
//  Hotel
//
//  Created by Алексей Баранов on 12.09.2023.
//

import Foundation

extension String {
    func formattedMask(text: String, mask: String?) -> String {
        let cleanPhoneNumber = text.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
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
        let mask = ["+", "7", " ", "(", "*", "*", "*", ")", " ", "*", "*", "*", "-", "*", "*", "-", "*", "*"]
        if result.count == 2 {
            result = ""
            for i in 0...3 {
                result.append(mask[i])
            }
            result.append(text)
        }
        var count = result.count
        while count < 18 {
            var index = result.count
            result.append(mask[index])
            index += 1
            count = result.count
        }
        return result
    }
}
