//
//  EventsAppApp.swift
//  EventsApp
//
//  Created by Darya Charniankova on 6.06.23.
//

import SwiftUI

@main
struct EventsAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                StartPage()
            }
        }
    }
}
