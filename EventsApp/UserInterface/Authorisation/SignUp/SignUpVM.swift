//
//  SignUpVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 16.06.23.
//

import SwiftUI
import Firebase

final class SignUpVM: ObservableObject {
    @Published var isSignUp = Bool()
    @Published var email = ""
    @Published var name = ""
    @Published var pass = ""
    @Published var confPass = ""
    
    lazy var provider: Providers = {
        Providers()
    }()
    
    func signUp() async {
        provider.signUpValidate(email: email,
                                pass: pass,
                                confPass: confPass)
        await provider.singUp(email: email,
                              pass: pass)
    }
    
    func createUser(email: String,
                    password: String,
                    nickname: String) async throws {
        
    }
}
