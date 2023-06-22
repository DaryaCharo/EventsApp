//
//  SettingVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 16.06.23.
//

import SwiftUI

final class SettingsVM: ObservableObject {
    
    @Published var settings: Settings?
    
    func signOut() {
        
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
