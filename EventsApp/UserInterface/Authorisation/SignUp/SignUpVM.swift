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
    @Published var email = ""
    @Published var pass = ""
    @Published var confPass = ""
    
    lazy var provider: Providers = {
        Providers()
    }()
    
    func signUp() {
        provider.signUpValidate(email: email,
                                pass: pass,
                                confPass: confPass)
        
        let user = UsersData(email: email,
                             pass: pass)
        
        //не очень понимаю, почему не видит
//        provider.signUp(email: email,
//                        pass: pass)
    }
}
