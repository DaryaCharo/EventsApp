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
                    Label("",
                          image: "Home")
                }
            EventNoteView()
                .tabItem {
                    Label("",
                          image: "Notification")
                }
            MapView()
                .tabItem {
                    Label("",
                          image: "Map")
                }
            EventCalendarView()
                .tabItem {
                    Label("",
                          image: "Calendar")
                }
            ProfileView()
                .tabItem {
                    Label("",
                          image: "Profile")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
