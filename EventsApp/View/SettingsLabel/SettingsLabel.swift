//
//  SettingsImage.swift
//  EventsApp
//
//  Created by Darya Charniankova on 5.07.23.
//

import SwiftUI

struct SettingsLabel: View {
    @State var type: Settings
    var body: some View {
        switch type {
            
        case .editProfile:
            Label {
                Text(Settings.editProfile.getText)
                    .padding(.leading)
            } icon: {
                Image(systemName: Settings.editProfile.getIcon)
                    .frame(width: 25, height: 25)
                    .padding(10)
                    .foregroundColor(.customPurple)
                    .background(Color.customPurple.opacity(0.2))
                    .clipShape(Circle())
                    .padding(8)
            }
        case .notification:
            Label {
                Text(Settings.notification.getText)
                    .padding(.leading)
            } icon: {
                Image(systemName: Settings.notification.getIcon)
                    .frame(width: 25, height: 25)
                    .padding(10)
                    .foregroundColor(.customPurple)
                    .background(Color.customPurple.opacity(0.2))
                    .clipShape(Circle())
                    .padding(8)
            }
        case .signOut:
            Label {
                Text(Settings.signOut.getText)
                    .padding(.leading)
            } icon: {
                Image(systemName: Settings.signOut.getIcon)
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

struct SettingsLabel_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabel(type: .editProfile)
    }
}
