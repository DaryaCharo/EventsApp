//
//  SettingsView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 15.06.23.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var vm: SettingsVM = .init()
    
    var body: some View {
        VStack {
            HeaderWithBackBtn(title: "Settings")
            
            listOfSettings
        }
    }
    
    private var listOfSettings: some View {
        VStack {
            List(Settings.allCases, id: \.self) { setting in
                HStack(spacing: 0) {
                    NavigationLink {
                        switch setting {
                        case .editProfile:
                            HomeView()
                        case .notification:
                            NotificationView()
                        case .signOut:
                            SignInView()
                        }
                    } label: {
                        Label {
                            Text(setting.getText)
                                .padding(.leading)
                        } icon: {
                            Image(systemName: setting.getIcon)
                                .frame(width: 25, height: 25)
                                .padding(10)
                                .foregroundColor(.customPurple)
                                .background(Color.customPurple.opacity(0.2))
                                .clipShape(Circle())
                                .padding(8)
                        }
                    }
                }
            }
            .listStyle(.inset)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
