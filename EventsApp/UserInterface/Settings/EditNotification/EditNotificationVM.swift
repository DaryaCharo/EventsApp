//
//  EditNotificationVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 8.07.23.
//

import Foundation

final class EditNotificationVM: ObservableObject {
    @Published var notifySettings: NotifySettings?
    @Published var onNotification = true
    
    func resetNotifications() {
        onNotification = true // временно
    }
}

enum NotifySettings {
    case notificationOnOff, showNotifications, reset
    
    var getText: String {
        switch self {
        case .notificationOnOff:
            return "Notifications"
        case .showNotifications:
            return "Show notifications"
        case .reset:
            return "Reset notifications"
        }
    }
}
