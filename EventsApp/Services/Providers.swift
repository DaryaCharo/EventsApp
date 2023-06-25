//
//  UserFirebaseData.swift
//  EventsApp
//
//  Created by Darya Charniankova on 19.06.23.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

final class Providers {
    private let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    private let passRegex = "/^(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]+$/"
    private let authorisation = Auth.auth()
    private lazy var fireDB: Firestore = {
        Firestore.firestore()
    }()
    private var validation: ValidationStatus?
    
    //MARK: - SignUp -
    
    func singUp(email: String,
                password: String) {
        guard validation == .accepted else { return }
        authorisation.createUser(withEmail: email,
                                 password: password) { authResult, error in
            UserDefaults.setValue(true,
                                  forKey: "IsUserSignIn")
        }
    }
    
    //MARK: - SignOut -
    
    func signOut() {
        do {
            try authorisation.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    //MARK: - validation -
    
    func signInValidate(email: String,
                        pass: String) {
        guard email.range(of: emailRegex, options: .regularExpression) != nil,
              pass.range(of: passRegex, options: .regularExpression) != nil,
              let password = FileManager.value(forKey: email) as? String,
              pass == password else { return validation = .denied }
        validation = .accepted
    }
    
    func signUpValidate(firstName: String,
                        surname: String,
                        email: String,
                        pass: String,
                        confPass: String) {
        guard firstName.trimmingCharacters(in: .whitespaces).isEmpty,
              surname.trimmingCharacters(in: .whitespaces).isEmpty,
              email.range(of: emailRegex, options: .regularExpression) != nil,
              pass.range(of: passRegex, options: .regularExpression) != nil,
              confPass.trimmingCharacters(in: .whitespaces).isEmpty,
              confPass != pass else { return validation = .denied }
        validation = .accepted
    }
}

enum ValidationStatus {
    case accepted, denied
}

