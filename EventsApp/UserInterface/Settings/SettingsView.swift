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
        .fullScreenCover(item: $vm.showView) { view in
            switch view {
            case .notification:
                EditNotificationView()
            case .startPage:
                StartPage()
            }
        }
    }
    
    private var listOfSettings: some View {
        VStack {
            List {
                Section {
                    Button {
                        vm.showView = .notification
                    } label: {
                        SettingsLabel(type: .notification)
                    }
                }
                Section {
                    Button {
                        vm.showView = .startPage
                        vm.signOut()
                    } label: {
                        SettingsLabel(type: .signOut)
                    }
                }
                Section {
                    Button {
                        vm.deleteAccount()
                    } label: {
                        SettingsLabel(type: .deleteAccount)
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
