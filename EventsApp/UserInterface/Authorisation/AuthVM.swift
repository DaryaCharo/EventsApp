//
//  AuthVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 4.07.23.
//

import SwiftUI
import Firebase
import Combine

protocol AuthFormProtocol {
    var formIsValid: ValidationStatus { get }
}

final class AuthVM: ObservableObject {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let fullNameRegex = "/^[a-z ,.'-]+$/i"
    lazy  var providers: Providers = {
        Providers()
    }()
    private var cancellable = Set<AnyCancellable>()
    @Published var showView: ShowView?
    @Published var showAlert: AlertTypes?
    @Published var email = ""
    @Published var fullName = ""
    @Published var pass = ""
    @Published var confPass = ""
    
    func continueWithEmail() async {        
        await providers.signIn(providerType: .firebase,
                               email: email,
                               pass: pass)
    }
    
    func continueWithGoogle() async {
        await providers.signIn(providerType: .google,
                               email: "",
                               pass: "")
    }
    
    func signUp() async {
        await providers.singUp(email: email,
                               pass: pass,
                               fullname: fullName)
    }
    
    deinit {
        cancellable.removeAll()
    }
    
    enum ShowView: Identifiable {
        case startPage
        
        var id: Int {
            return 1
        }
    }
    
    enum AlertTypes: Identifiable {
        case email, fullName, pass, confPass, userIsExist
        
        var id: Int {
            switch self {
            case .email:
                return 1
            case .fullName:
                return 2
            case .pass:
                return 3
            case .confPass:
                return 4
            case .userIsExist:
                return 5
            }
        }
    }
}

enum ValidationStatus {
    case accepted, denied
}
