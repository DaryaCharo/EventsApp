//
//  SettingVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 16.06.23.
//

import SwiftUI

final class SettingsVM: ObservableObject {
    lazy  var providers: Providers = {
        Providers()
    }()
    @Published var baseSettings: BaseSettings?
    @Published var showView: ShowView?
    
    func signOut() {
        providers.signOut()
    }
    
    //обёрнуто в такс, чтобы вызвать во вью
    func deleteAccount() {
        Task {
            await providers.deleteUser()
        }
    }
    
    enum ShowView: Identifiable {
        case startPage, notification
        
        var id: Int {
            self == .startPage ? 1 : 2 
        }
    }
}

enum BaseSettings: Int, CaseIterable, Identifiable {
    case editProfile = 0, notification, signOut, deleteAccount
    
    var getText: String {
        switch self {
        case .editProfile:
            return "Edit profile"
        case .notification:
            return "Notification"
        case .signOut:
            return "Sign Out"
        case .deleteAccount:
            return "Delete account"
        }
    }
    
    var getIcon: String {
        switch self {
        case .editProfile:
            return "person.fill"
        case .notification:
            return "bell.fill"
        case .signOut:
            return "rectangle.trailinghalf.inset.filled.arrow.trailing"
        case .deleteAccount:
            return "xmark.bin.fill"
        }
    }
    
    var id: Int {
        switch self {
        case .editProfile:
            return 1
        case .notification:
            return 2
        case .signOut:
            return 3
        case .deleteAccount:
            return 4
        }
    }
}

