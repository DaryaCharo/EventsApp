//
//  SettingVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 16.06.23.
//

import SwiftUI

final class SettingsVM: ObservableObject {
    
    func goToPage(type: Settings) {
        switch type {
        case .editProfile:
            NavigationLink {
                
            } label: {
                Label {
                    Text(type.getText)
                } icon: {
                    Image(systemName: "person.fill")
                        .foregroundColor(.customPurple)
                }
            }
        case .notification:
            NavigationLink {
                NotificationView()
            } label: {
                Label {
                    Text(type.getText)
                } icon: {
                    Image(systemName: "bell.fill")
                        .foregroundColor(.customPurple)
                }

            }
        case .security:
            NavigationLink {
                
            } label: {
                Label {
                    Text(type.getText)
                } icon: {
                    Image(systemName: "lock.fill")
                        .foregroundColor(.customPurple)
                }
            }
        case .appearance:
            NavigationLink {
                
            } label: {
                Text(type.getText)
            }
        case .help:
            NavigationLink {
                
            } label: {
                Text(type.getText)
            }
        case .inviteFriends:
            NavigationLink {
                
            } label: {
                Text(type.getText)
            }
        case .signOut:
            NavigationLink {
                SignInView()
            } label: {
                Label {
                    Text(type.getText)
                } icon: {
                    Image(systemName: "")
                }
            }
        }
    }
    
    func signOut() {
        
    }
    
}

enum Settings: Int, CaseIterable {
    case editProfile = 0, notification, security, appearance, help, inviteFriends, signOut
    
    var getText: String {
        switch self {
        case .editProfile:
            return "Edit profile"
        case .notification:
            return "Notification"
        case .security:
            return "Security"
        case .appearance:
            return "Appearance"
        case .help:
            return "Help"
        case .inviteFriends:
            return "Invite friends"
        case .signOut:
            return "Sign Out"
        }
    }
}
