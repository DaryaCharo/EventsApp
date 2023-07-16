//
//  ProfileVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 15.06.23.
//

import SwiftUI

final class ProfileVM: ObservableObject {
    lazy  var providers: Providers = {
        Providers()
    }()
    @Published var showView: ShowView?
    @Published var fullname = ""
    @Published var id = ""
    @Published var email = ""
    @Published var avatar = ""
    
    func getUser() async {
        await providers.fetchUser()
        guard let user = providers.currentUser else { return }
        await MainActor.run {
            fullname = user.fullname
            id = user.id
            email = user.email
            avatar = user.avatar
        }
    }
    
    enum ShowView: Identifiable {
        case editProfile
        
        var id: Int {
            return 1
        }
    }
}
