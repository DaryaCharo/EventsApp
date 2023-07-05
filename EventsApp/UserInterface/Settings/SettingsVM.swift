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
    @Published var settings: Settings?
    @Published var showView: ShowView?
    
    func signOut() {
        providers.signOut()
    }
    enum ShowView: Identifiable {
        case startPage, notification
        
        var id: Int {
            switch self {
            case .startPage:
                return 1
            case .notification:
                return 2
            }
        }
    }
}

enum Settings: Int, CaseIterable, Identifiable {
    case editProfile = 0, notification, signOut
    
    var getText: String {
        switch self {
        case .editProfile:
            return "Edit profile"
        case .notification:
            return "Notification"
        case .signOut:
            return "Sign Out"
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
        }
    }
}
