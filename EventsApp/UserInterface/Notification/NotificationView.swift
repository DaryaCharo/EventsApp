//
//  NotificationView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 17.06.23.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        VStack {
            HeaderWithBackBtn(title: "Notifications")
            Spacer()
        }
    }
    
    private var listOfNotifications: some View {
        ScrollView(.vertical,
                   showsIndicators: false) {
            VStack {
                
            }
        }
        .padding(.top)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
