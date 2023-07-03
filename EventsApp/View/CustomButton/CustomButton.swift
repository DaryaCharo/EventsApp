//
//  Buttons.swift
//  EventsApp
//
//  Created by Darya Charniankova on 16.06.23.
//

import SwiftUI

struct CustomButton: View {
    
    @StateObject private var vm = CustomButtonVM()
    @Environment(\.dismiss) private var dismiss
    @State var type: ButtonType
    
    var body: some View {
        VStack {
            switch type {
            case .back:
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.customPurple)
                }
                .padding()
            case .settings:
                Button {
                    vm.showView = .settings
                } label: {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(.customPurple)
                }
                .buttonStyle(UserInteractionButtonsStyle())
            case .notification:
                Button {
                    vm.showView = .notification
                } label: {
                    Image(systemName: "bell.fill")
                        .foregroundColor(.customPurple)
                }
                .buttonStyle(UserInteractionButtonsStyle())
            case .favourite:
                Button {
                    vm.makeFavourite()
                } label: {
                    Image(systemName: vm.isFavourite ? "bookmark.fill" : "bookmark")
                        .foregroundColor(.customPurple)
                }
                .buttonStyle(UserInteractionButtonsStyle())
            case .search:
                Button {
                    vm.showView = .search
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.customPurple)
                }
                .buttonStyle(UserInteractionButtonsStyle())
            }
        }
        .fullScreenCover(item: $vm.showView) { view in
            switch vm.showView {
            case .notification:
                NotificationView()
            case .search:
                SearchView(searchText: .constant(""))
            case .settings:
                SettingsView()
            case .none:
                HomeView()
            }
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(type: .notification)
    }
}
