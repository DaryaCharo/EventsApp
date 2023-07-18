//
//  UserFirebaseData.swift
//  EventsApp
//
//  Created by Darya Charniankova on 19.06.23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import GoogleSignIn
import SwiftUI

final class Providers {
    var userSession: FirebaseAuth.User?
    var currentUser: UserData?
    let authorisation = Auth.auth()
    var favouritesIDs: [Int] = []
    private lazy var fireDB: Firestore = {
        Firestore.firestore()
    }()
    
    init() {
        self.userSession = authorisation.currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    //MARK: - favouriteEvent
    func changeFavourites(eventID: Int,
                          action: ActionType) async {
        guard let user = currentUser else { return }
        switch action {
        case .add:
            do {
                try await fireDB.collection("Users").document(user.id)
                    .collection("Favourites").document(eventID.description).setData(["Event ID" : eventID])
                favouritesIDs.append(eventID)
                await fetchUser()
            } catch {
                print(error)
            }
        case .update:
            do {
                try await fireDB.collection("Users").document(user.id)
                            .collection("Favourites").document(eventID.description).updateData(["Event ID" : eventID])
                favouritesIDs.removeAll(where: { $0 == eventID })
                await fetchUser()
            } catch {
                print(error)
            }
        case .check:
            do {
                let snapshot = try await fireDB.collection("Users").document(user.id).collection("Favourites").document(eventID.description).getDocument()
                favouritesIDs.append(try snapshot.data(as: Int.self))
                await fetchUser()
            } catch {
                print(error)
            }
        }
    }
    
    //MARK: - deleteUser
    
    func deleteUser() async {
        guard let user = currentUser else { return }
        do {
            try await fireDB.collection("Users").document(user.id).delete()
        } catch {
            print(error)
        }
    }
    
    //MARK: - fetchUser
    
    func fetchUser() async {
        guard let uid = authorisation.currentUser?.uid else { return }
        do {
            let snapshot = try await fireDB.collection("Users").document(uid).getDocument()
            self.currentUser = try snapshot.data(as: UserData.self)
        } catch {
            print(error)
        }
    }
    
    //MARK: - changeUserInfo
    
    func changeUserInfo(id: String,
                        email: String,
                        fullName: String,
                        avatar: Data) async {
        guard let user = currentUser else { return }
        do {
            try await fireDB.collection("Users").document(user.id).updateData(["Email" : email,
                                                                                "Full name" : fullName,
                                                                                "ID" : id,
                                                                                "Avatar" : avatar])
        } catch {
            print(error)
        }
    }
    
    //MARK:  SignUp
    
    func singUp(email: String,
                pass: String,
                fullName: String,
                avatar: Data = Data.empty) async {
        do {
            let result = try await authorisation.createUser(withEmail: email,
                                                            password: pass)
            userSession = result.user
            let user = UserData(id: result.user.uid,
                                email: email,
                                fullName: fullName,
                                avatar: avatar)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await fireDB.collection("Users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print(error)
        }
        
        
    }
    
    //MARK: - Sign in
    //@MainActor for Google Authorisation
    @MainActor func signIn(providerType: ProviderType,
                           email: String,
                           pass: String) async {
        
        switch providerType {
        case .firebase:
            do {
                let result = try await authorisation.signIn(withEmail: email,
                                                      password: pass)
                self.userSession = result.user
                await fetchUser()
            } catch {
                print(error)
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
                guard let user = UserDefaults.value(forKey: "GoogleUser") as? User,
                      user != authResult.user else { return }
                    self.userSession = authResult.user
                    let firestoreUser = UserData(id: authResult.user.uid,
                                                 email: authResult.user.email ?? "",
                                                 fullName: authResult.user.displayName ?? "",
                                                 avatar: Data())
                    let encodedUser = try Firestore.Encoder().encode(firestoreUser)
                    try await fireDB.collection("Google users").document(user.getIDToken()).setData(encodedUser)
                await fetchUser()
            } catch {
                print(error)
            }
        }
    }
    
    //MARK:  SignOut
    
    func signOut() {
        do {
            try authorisation.signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("Error signing out: %@", error)
        }
    }
}

enum ProviderType {
    case google, firebase
}
enum ActionType {
    case add, update, check
}
