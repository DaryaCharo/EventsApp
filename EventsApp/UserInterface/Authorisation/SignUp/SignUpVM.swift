//
//  SignUpVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 16.06.23.
//

import SwiftUI
import Combine

final class SignUpVM: ObservableObject {
    @Published var isSignUp = Bool()
    @Published var firstName = ""
    @Published var surname = ""
    @Published var email = ""
    @Published var pass = ""
    @Published var confPass = ""
    
    lazy var provider: Providers = {
        Providers()
    }()
    
    func signUp() {
        provider.signUpValidate(firstName: firstName,
                                surname: surname,
                                email: email,
                                pass: pass,
                                confPass: confPass)
        
        let user = UsersData(firstName: firstName,
                             surname: surname,
                             email: email,
                             pass: pass)
        
        provider.signUp(user: user)
    }
}
