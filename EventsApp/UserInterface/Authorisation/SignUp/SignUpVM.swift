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
    
    lazy var firebaseProvider: Providers = {
        Providers()
    }()
    
    func signUp() {
        guard firebaseProvider.signUpValidate(firstName: firstName,
                                              surname: surname,
                                              email: email,
                                              pass: pass,
                                              confPass: confPass) else { return }
        
        let user = UsersData(firstName: firstName,
                             surname: surname,
                             email: email,
                             pass: pass)
        
        firebaseProvider.signUp(user: user)
    }
}
