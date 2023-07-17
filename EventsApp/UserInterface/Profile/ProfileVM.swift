//
//  ProfileVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 15.06.23.
//

import SwiftUI

protocol ProfileFormProtocol {
    var formIsValid: ValidationStatus { get }
}

final class ProfileVM: ObservableObject {
    lazy  var providers: Providers = {
        Providers()
    }()
    @Published var showView: ShowView?
    @Published var fullName = ""
    @Published var id = ""
    @Published var email = ""
    @Published var avatar = ""
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let fullNameRegex = "^(?=.{2,100}$)[A-Za-zÀ-ú][A-Za-zÀ-ú.'-]+(?: [A-Za-zÀ-ú.'-]+)* *$"
    
    func getUser() async {
        await providers.fetchUser()
        guard let user = providers.currentUser else { return }
        await MainActor.run {
            fullName = user.fullName
            id = user.id
            email = user.email
            avatar = user.avatar
        }
    }
    
    func changeUserInfo() async {
        await providers.changeUserInfo(id: id,
                                       email: email,
                                       fullName: fullName)
        await getUser()
    }
    
    enum ShowView: Identifiable {
        case editProfile
        
        var id: Int {
            return 1
        }
    }
}
