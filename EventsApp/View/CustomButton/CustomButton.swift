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
                
            } label: {
                Image(systemName: "gearshape.fill")
                    .foregroundColor(.customPurple)
            }
            .buttonStyle(UserInteractionButtonsStyle())
//            .fullScreenCover(item: $vm.showView) { _ in
//                SettingsView()
//            }
        case .notification:
            Button {
                
            } label: {
                Image(systemName: "bell.fill")
                    .foregroundColor(.customPurple)
            }
            .buttonStyle(UserInteractionButtonsStyle())
//            .fullScreenCover(item: $vm.showView) { _ in
//                NotificationView()
//            }
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
            } label: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.customPurple)
            }
            .buttonStyle(UserInteractionButtonsStyle())
//            .fullScreenCover(item: $vm.showView) { _ in
//                SearchView(searchText: .constant(""))
//            }
        case .filter:
            Button {
                
            } label: {
                Image(systemName: "list.star")
                    .foregroundColor(.customPurple)
            }
            .buttonStyle(UserInteractionButtonsStyle())
        case.navigation:
            Button {
                
            } label: {
                Image("Navigation")
            }
            .buttonStyle(UserInteractionButtonsStyle())
        case .changePhoto:
            Button {
                
            } label: {
                Image(systemName: "pencil.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.customPurple)
            }
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(type: .notification)
    }
}
