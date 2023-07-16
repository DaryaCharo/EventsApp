//
//  SettingsImage.swift
//  EventsApp
//
//  Created by Darya Charniankova on 5.07.23.
//

import SwiftUI

struct SettingsLabel: View {
    @StateObject var baseVM = SettingsVM()
    @StateObject var notifyVM = EditNotificationVM()
    @State var settingsType: SettingsType
    @State var baseType: BaseSettings = .editProfile
    @State var notifyType: NotifySettings = .notificationOnOff
    
    var body: some View {
        
        if settingsType == .base {
            switch baseVM.baseSettings {
            case .editProfile:
                Label {
                    Text(BaseSettings.editProfile.getText)
                        .padding(.leading)
                } icon: {
                    Image(systemName: BaseSettings.editProfile.getIcon)
                        .frame(width: 25, height: 25)
                        .padding(10)
                        .foregroundColor(.customPurple)
                        .background(Color.customPurple.opacity(0.2))
                        .clipShape(Circle())
                        .padding(8)
                }
            case .notification:
                Label {
                    Text(BaseSettings.notification.getText)
                        .padding(.leading)
                } icon: {
                    Image(systemName: BaseSettings.notification.getIcon)
                        .frame(width: 25, height: 25)
                        .padding(10)
                        .foregroundColor(.customPurple)
                        .background(Color.customPurple.opacity(0.2))
                        .clipShape(Circle())
                        .padding(8)
                }
            case .signOut:
                Label {
                    Text(BaseSettings.signOut.getText)
                        .padding(.leading)
                } icon: {
                    Image(systemName: BaseSettings.signOut.getIcon)
                        .frame(width: 25, height: 25)
                        .padding(10)
                        .foregroundColor(.customPurple)
                        .background(Color.customPurple.opacity(0.2))
                        .clipShape(Circle())
                        .padding(8)
                }
            case .deleteAccount:
                Label {
                    Text(BaseSettings.deleteAccount.getText)
                        .padding(.leading)
                } icon: {
                    Image(systemName: BaseSettings.deleteAccount.getIcon)
                        .frame(width: 25, height: 25)
                        .padding(10)
                        .foregroundColor(.customPurple)
                        .background(Color.customPurple.opacity(0.2))
                        .clipShape(Circle())
                        .padding(8)
                }
            case .none:
                Text("")
            }
        } else {
            switch notifyVM.notifySettings {
            case .notificationOnOff:
                HStack {
                    Text(NotifySettings.notificationOnOff.getText)
                    Spacer()
                    Toggle(isOn: $notifyVM.onNotification) {
                        
                    }
                }
                
            case .showNotifications:
                HStack {
                    Text(NotifySettings.showNotifications.getText)
                    Spacer()
                    Toggle(isOn: $notifyVM.onNotification) {
                        
                    }
                }
            case .reset:
                HStack {
                    Button {
                        notifyVM.resetNotifications()
                    } label: {
                        Text(NotifySettings.reset.getText)
                    }
                }
            case .none:
                Text("")
            }
        }
    }
}

struct SettingsLabel_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabel(settingsType: .base)
    }
}
