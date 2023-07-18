//
//  SettingsImage.swift
//  EventsApp
//
//  Created by Darya Charniankova on 5.07.23.
//

import SwiftUI

struct SettingsLabel: View {
    @StateObject var vm = SettingsVM()
    @State var type: BaseSettings
    
    var body: some View {
        Label {
            Text(type.getText)
                .padding(.leading)
        } icon: {
            Image(systemName: type.getIcon)
                .frame(width: 25, height: 25)
                .padding(10)
                .foregroundColor(type == .deleteAccount ?
                    .customRed : .customPurple)
                .background(type == .deleteAccount ?
                            Color.customRed.opacity(0.2) :
                                Color.customPurple.opacity(0.2))
                .clipShape(Circle())
                .padding(8)
        }
    }
}

struct SettingsLabel_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabel(type: .deleteAccount)
    }
}
