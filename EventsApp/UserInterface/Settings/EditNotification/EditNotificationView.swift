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
            HeaderWithBackBtn(title: "Уведомления")
            
            settings
            Spacer()
        }
    }
    
    private var settings: some View {
        List {
            Section {
                NotificationSettingsLabel(type: .notificationOnOff)
            }
            Section {
                NotificationSettingsLabel(type: .showNotifications)
            }
            Section {
                NotificationSettingsLabel(type: .reset)
            }
        }
    }
}

struct EditNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        EditNotificationView()
    }
}
