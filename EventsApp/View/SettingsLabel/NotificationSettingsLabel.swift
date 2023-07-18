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
        HStack {
            switch type {
            case .notificationOnOff:
                
                Text(type.getText)
                Spacer()
                Toggle(isOn: $vm.onNotification) {
                    
                }
            case .showNotifications:
                Text(type.getText)
                Spacer()
                Toggle(isOn: $vm.onNotification) {
                    
                }
            case .reset:
                Button {
                    vm.resetNotifications()
                } label: {
                    Text(type.getText)
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
