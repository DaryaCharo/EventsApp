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
import GoogleSignIn

final class Providers {
    private let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    private let passRegex = "/^(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]+$/"
    private let authorisation = Auth.auth()
    private lazy var fireDB: Firestore = {
        Firestore.firestore()
    }()
    private var validation: ValidationStatus?
    
    //MARK:  SignUp
    
    func singUp(email: String,
                pass: String)  {
        guard validation == .accepted else { return }
        authorisation.createUser(withEmail: email,
                                 password: pass) { authResult, error in
            
            Firestore.setValuesForKeys(["ID" : authResult?.user.uid ?? UUID(),
                                        "Email Address" : email,
                                        "Nickname" : authResult?.user.displayName ?? "No nickname",
                                        "Password" : pass])
            
        }
    }
    
    //MARK: - Sign in
    //@MainActor for Google Authorisation
    @MainActor func signIn(providerType: ProviderType,
                           email: String,
                           pass: String) async {
        
        switch providerType {
        case .firebase:
            await MainActor.run {
                authorisation.signIn(withEmail: email,
                                     password: pass) { [weak self] authResult, error in
                    guard let self = self,
                          self.validation == .accepted else { return }
                }
            }
        case .google:
            guard let clientID = authorisation.app?.options.clientID,
                  let presentingViewController = (UIApplication.shared.connectedScenes.first
                                                  as? UIWindowScene)?.windows.first?.rootViewController else { return }
            // Create Google SignIn configuration object
            GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: clientID)
            
            
            do {
                let user = try await GIDSignIn.sharedInstance.signIn(withPresenting:
                                                                        presentingViewController).user
                guard let idToken = user.idToken else { return }
                
                let authResult = try await authorisation.signIn(with: GoogleAuthProvider.credential(withIDToken: idToken.description,
                                                                                                    accessToken: user.accessToken.tokenString))
                
                UserDefaults.setValue(authResult.user, forKey: "GoogleUser")
                if let user = UserDefaults.value(forKey: "GoogleUser") as? User,
                   user != authResult.user {
                    try await Firestore.setValue(user.getIDToken(),
                                                 forKey: user.email ?? "User token")
                }
            } catch {
                print(error)
            }
        }
    }
    
    //MARK:  SignOut
    
    func signOut() {
        do {
            try authorisation.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    //MARK:  validation
    
    func signInValidate(email: String,
                        pass: String) {
        guard email.range(of: emailRegex, options: .regularExpression) != nil,
              pass.range(of: passRegex, options: .regularExpression) != nil,
              let password = FileManager.value(forKey: email) as? String,
              pass == password else { return validation = .denied }
        validation = .accepted
    }
    
    func signUpValidate(email: String,
                        pass: String,
                        confPass: String) {
        guard email.range(of: emailRegex, options: .regularExpression) != nil,
              pass.range(of: passRegex, options: .regularExpression) != nil,
              confPass.trimmingCharacters(in: .whitespaces).isEmpty,
              confPass != pass else { return validation = .denied }
        validation = .accepted
    }
}

enum ValidationStatus {
    case accepted, denied
}

enum ProviderType {
    case google, firebase
}

enum DataStatus {
    case unloaded, loading, fetchData
}
