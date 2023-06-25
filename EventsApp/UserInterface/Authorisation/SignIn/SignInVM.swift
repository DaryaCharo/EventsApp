//
//  SignInVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 16.06.23.
//

import Combine
import SwiftUI

final class SignInVM: ObservableObject {
    @Published var rememberUser = Bool()
    private var cancellable = Set<AnyCancellable>()
    private lazy  var providers: Providers = {
        Providers()
    }()
    @Published var showView: ShowView?
    @Published var signUpVM = SignUpVM()
    
    @Published var email = ""
    @Published var pass = ""
    
    
    
    init() {
        $email
            .removeDuplicates()
            .sink { [weak self] email in
                guard let self = self else { return }
                self.signUpVM.email = email
                print(email)
            }
            .store(in: &cancellable)
    }
    
    func continueWithEmail() {
        guard providers.signInValidate(email: email,
                                       pass: pass) else { return }
        Task {
            await providers.signIn(providerType: .firebase,
                                   email: email,
                                   pass: pass)
        }
    }
    
    @MainActor func continueWithGoogle() async {
        await providers.signIn(providerType: .google,
                               email: "",
                               pass: "")
    }
    
    deinit {
        cancellable.removeAll()
    }
}

enum ShowView {
    case homeView, signUpView
}
