//
//  BuyerInformationViewModel.swift
//  Hotel
//
//  Created by Алексей Баранов on 12.09.2023.
//

import Foundation
import Combine

class BuyerInformationViewModel: ObservableObject {
//    @Published var buyer: BuyerModel = BuyerModel(phoneNumber: "", email: "")
    
    @Published var email = ""
    @Published var phone = ""
    @Published var canSubmit = false
    
    @Published var isValidEmail = true
    @Published var isValidPhone = false
    
    private let emailPredicate = NSCompoundPredicate(format: "SELF MATCHES %@", Redax.email.rawValue)
//    private let phonePredicate = NSCompoundPredicate(format: "SELF MATCHES %@", Redax.phone.rawValue)
    
    private var cancellable: Set<AnyCancellable> = []
    
    init() {
        $email
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { email in
                return self.emailPredicate.evaluate(with: email)
            }
            .assign(to: \.isValidEmail, on: self)
            .store(in: &cancellable)
        
        $phone
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { phone in
//                return self.phonePredicate.evaluate(with: phone)
                return true
            }
            .assign(to: \.isValidPhone, on: self)
            .store(in: &cancellable)
        
        Publishers.CombineLatest($isValidEmail,$isValidPhone)
            .map { email, phone in
                return (email && phone)
            }
            .assign(to: \.canSubmit, on: self)
            .store(in:&cancellable)
    }
}

enum Redax: String {
    case phone = "(\\s*)?(\\+)?([- _():=+]?\\d[- _():=+]?){10,14}(\\s*)?"
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
}
