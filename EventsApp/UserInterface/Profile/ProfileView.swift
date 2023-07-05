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
            Spacer()
            bio
            Spacer()
        }
        .fullScreenCover(item: $vm.showView) { view in
            EditProfileView()
        }
    }
    
    private var bio: some View {
        VStack {
            Text("Info about me")
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    private var avatar: some View {
        VStack {
            ZStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .foregroundColor(.customPurple).opacity(0.6)
                    .frame(maxWidth: 80, maxHeight: 80)
                    .padding()
                    .background(Color.white)
                    .clipShape(Circle())
                    .padding()
                    .shadow(radius: 1)
                    
                Button {
                    vm.showView = .editProfile
                } label: {
                    Image(systemName: "pencil.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.customPurple)
                }
                    .frame(maxWidth: 100, maxHeight: 100,
                           alignment: .bottomTrailing)
            }
            Text(vm.getName())
                .font(.customFont(type: .semiBold,
                                  size: 24))
        }
    }
    
    private var header: some View {
        HStack {
            HeaderWithLogo(title: "Profile")
            
            Spacer()
            
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
