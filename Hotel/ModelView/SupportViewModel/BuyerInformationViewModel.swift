//
//  BuyerInformationViewModel.swift
//  Hotel
//
//  Created by Алексей Баранов on 12.09.2023.
//

import Foundation
import Combine

class BuyerInformationViewModel: ObservableObject {
    @Published var email = ""
    @Published var phoneSet = ""
    @Published var phoneGet = ""
    @Published var isValidEmail = true
    
    private let emailPredicate = NSCompoundPredicate(format: "SELF MATCHES %@", Redax.email.rawValue)
    
    private var cancellable: Set<AnyCancellable> = []
    
    init() {
        $email
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { email in
                return self.emailPredicate.evaluate(with: email)
            }
            .assign(to: \.isValidEmail, on: self)
            .store(in: &cancellable)
        
        $phoneSet
            .map { phoneSet in
                var result = phoneSet
                let mask = ["+", "7", " ", "(", "*", "*", "*", ")", " ", "*", "*", "*", "-", "*", "*", "-", "*", "*"]
                while result.count < 18 {
                    result.append(mask[result.count])
                }
                return result
            }
            .assign(to: \.phoneGet, on: self)
            .store(in: &cancellable)
    }
}


