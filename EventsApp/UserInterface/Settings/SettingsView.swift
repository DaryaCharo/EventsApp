//
//  SettingsView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 15.06.23.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var vm: SettingsVM = .init()
    @StateObject private var profileVM = ProfileVM()
    
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
                        SettingsLabel(settingsType: .base,
                                      baseType: .notification)
                    }
                }
                Section {
                    Button {
                        vm.showView = .startPage
                        vm.signOut()
                    } label: {
                        SettingsLabel(settingsType: .base,
                                      baseType: .signOut)
                    }
                }
                Section {
                    Button {
                        vm.deleteAccount(id: profileVM.id)
                    } label: {
                        SettingsLabel(settingsType: .base,
                                      baseType: .deleteAccount)
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
