//
//  ProfileView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 14.06.23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var vm = ProfileVM()
    
    var body: some View {
        VStack {
            header
            
            avatar
            bio
            Spacer()
        }
        .fullScreenCover(item: $vm.showView) { view in
            EditProfileView(vm: vm)
        }
        .task {
            await vm.getUser()
        }
    }
    
    private var bio: some View {
        VStack {
            Text(vm.bio)
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    private var avatar: some View {
        VStack {
            AvatarView()
                .padding(.bottom)
            Text(vm.fullName)
                .font(.customFont(type: .semiBold,
                                  size: 24))
        }
        .padding(.bottom)
    }
    
    private var header: some View {
        HStack {
            HeaderWithLogo(title: "Profile")
            
            Spacer()
            
            Button {
                vm.showView = .editProfile
            } label: {
                Image(systemName: "pencil")
                    .imageScale(.large)
                    .bold()
                    .foregroundColor(.customPurple)
            }
            .buttonStyle(UserInteractionButtonsStyle())

            CustomButton(type: .settings)
                .padding(.trailing)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
