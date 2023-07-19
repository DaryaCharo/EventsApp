//
//  TabBarView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 14.06.23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image("Home")
                }
            EventNoteView()
                .tabItem {
                    Image("Notification")
                }
            MapView()
                .tabItem {
                    Image("Map")
                }
            EventCalendarView()
                .tabItem {
                    Image("Calendar")
                }
            ProfileView()
                .tabItem {
                    Image("Profile")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
