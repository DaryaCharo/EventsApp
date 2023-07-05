//
//  SettingsView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 15.06.23.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var vm: SettingsVM = .init()
    @ObservedObject private var profileVM = ProfileVM()
    
    var body: some View {
        VStack {
            HeaderWithBackBtn(title: "Settings")
            
            listOfSettings
        }
        .fullScreenCover(item: $vm.showView) { view in
            switch view {
            case .editProfile:
                EditProfileView(id: $profileVM.id,
                                email: $profileVM.email,
                                name: $profileVM.fullname)
            case .notification:
                EditNotificationView()
            case .startPage:
                StartPage()
            }
        }
        .task {
            await profileVM.getUser()
        }
    }
    
    private var listOfSettings: some View {
        VStack {
            List {
                Section {
                    Button {
                        vm.showView = .editProfile
                    } label: {
                        SettingsLabel(type: .editProfile)
                    }
                }
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
