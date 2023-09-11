//
//  View+extension.swift
//  Hotel
//
//  Created by Алексей Баранов on 11.09.2023.
//

import SwiftUI

extension View {
    func grayTextField() -> some View {
        modifier(GrayWindowModifier())
    }
}
