//
//  NumberViewModel.swift
//  Hotel
//
//  Created by Алексей Баранов on 08.09.2023.
//

import Foundation
import SwiftUI

class NumberViewModel: ObservableObject {
    private let client = NetworkManager.instance
    @MainActor @Published private(set) var numbers: NumberModel?
    
    var request: URLRequest = {
        let urlString = "https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd"
        let url = URL(string: urlString)!
        return URLRequest(url: url)
    }()
    
    func fetchHNumbers() async {
        let response = await client.fetch(type: NumberModel.self, with: request)
        switch response {
        case .success(let success):
            Task { @MainActor in
                numbers = success
            }
        case .failure(let failure):
            print(failure.localizedDescription)
        }
    }
}
