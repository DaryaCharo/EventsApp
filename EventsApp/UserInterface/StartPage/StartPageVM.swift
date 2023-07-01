//
//  StartPageVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 8.06.23.
//

import SwiftUI
import Firebase

final class StartPageVM: ObservableObject {
    @Published var userSession: FirebaseAuth.User? //to know if user sign in
    @Published var currentUser: User?
    
}
