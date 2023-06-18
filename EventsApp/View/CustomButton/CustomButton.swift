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
        case .notification:
            Button {
                
            } label: {
                Image(systemName: "bell.fill")
                    .foregroundColor(.customPurple)
            }
        case .favourite:
            Button {
                vm.makeFavourite()
            } label: {
                Image(systemName: vm.isFavourite ? "bookmark.fill" : "bookmark")
                    .foregroundColor(.customPurple)
            }
        case .search:
            Button {
                
            } label: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.customPurple)
            }
        case .filter:
            Button {
                
            } label: {
                Image(systemName: "arrow.left")
                    .foregroundColor(.customPurple)
            }
        case.navigation:
            Button {
                
            } label: {
                Image("Navigation")
            }
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(type: .back)
    }
}

enum ButtonType {
    case back, settings, notification, favourite, search, filter, navigation
}
