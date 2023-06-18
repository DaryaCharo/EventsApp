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
            HStack {
                CustomButton(type: .back)
                
                Text("Settings")
                    .font(.customFont(type: .semiBold, size: 24))
                
                Spacer()
            }
            listOfSettings
        }
    }
    
    private var listOfSettings: some View {
        VStack {
            List(Settings.allCases, id: \.self) { setting in
                HStack(spacing: 0) {
                    NavigationLink {
//                        vm.goToPage(type: setting)
                    } label: {
                        Text(setting.getText)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 60)
            }
        }
        .listStyle(.inset)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
