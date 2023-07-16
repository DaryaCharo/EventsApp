//
//  EditNotificationView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 5.07.23.
//

import SwiftUI

struct EditNotificationView: View {
    
    var body: some View {
        VStack {
            HeaderWithBackBtn(title: "Notification")
            
            settings
            Spacer()
        }
    }
    
    private var settings: some View {
        List {
            Section {
                SettingsLabel(settingsType: .notification,
                              notifyType: .notificationOnOff)
            }
            Section {
                SettingsLabel(settingsType: .notification,
                              notifyType: .showNotifications)
            }
            Section {
                SettingsLabel(settingsType: .notification,
                              notifyType: .reset)
            }
        }
    }
}

struct EditNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        EditNotificationView()
    }
}
