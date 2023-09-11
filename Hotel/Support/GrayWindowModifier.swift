//
//  GrayWindowModifier.swift
//  Hotel
//
//  Created by Алексей Баранов on 11.09.2023.
//

import SwiftUI

struct GrayWindowModifier: ViewModifier {
    func body(content: Content) -> some View {
           content
            .frame(height: 50)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .background(Color(hex: 0xF6F6F9))
            .cornerRadius(10)
       }
}

