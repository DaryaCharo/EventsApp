//
//  SignInVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 16.06.23.
//

import Combine
import SwiftUI

final class SignInVM: ObservableObject {
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
            }
            .store(in: &cancellable)
    }
    
    func continueWithEmail() async {
        providers.signInValidate(email: email,
                                 pass: pass)
        
        await providers.signIn(providerType: .firebase,
                               email: email,
                               pass: pass)
    }
    
    func continueWithGoogle() async {
        await providers.signIn(providerType: .google,
                               email: "",
                               pass: "")
    }
    
    deinit {
        cancellable.removeAll()
    }
}

enum ShowView: Identifiable {
    var id: Int {
        switch self {
        case .homeView:
            return 1
        }
    }
    
    case homeView
}
