//
//  NotificationSettingsLabel.swift
//  EventsApp
//
//  Created by Darya Charniankova on 17.07.23.
//

import SwiftUI

struct NotificationSettingsLabel: View {
    @StateObject var vm = EditNotificationVM()
    @State var type: NotifySettings
    
    var body: some View {
        if type == .reset {
            HStack {
                Button {
                    vm.resetNotifications()
                } label: {
                    Text(type.getText)
                }
            }
        } else {
            HStack {
                Text(type.getText)
                Spacer()
                Toggle(isOn: $vm.onNotification) {
                    
                }
            }
        }
    }
}

struct NotificationSettingsLabel_Previews: PreviewProvider {
    static var previews: some View {
        NotificationSettingsLabel(type: .notificationOnOff)
    }
}
