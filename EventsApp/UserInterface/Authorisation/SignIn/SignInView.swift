//
//  SignInView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 16.06.23.
//

import SwiftUI

struct SignInView: View {
    @StateObject var vm = SignInVM()
    
    var body: some View {
        VStack {
            LogoView()
                .padding(40)
            
            Text("Sign in to your account")
                .font(.customFont(type: .semiBold, size: 25))
            
            
            Spacer()
            
            signUpLink
            
            Spacer()
        }
    }
    
    private var rememberUserSwitcher: some View {
        Toggle(isOn: $vm.rememberUser) {
            Text("Remember me")
                .font(.customFont(type: .semiBold,
                                  size: 16))
            
        }
    }
    
    private var signUpLink: some View {
        NavigationLink {
            SignUpView()
        } label: {
            HStack {
                Text("Already have an account? ") +
                Text("Login").foregroundColor(.customPurple)
            }
            .frame(maxWidth: .infinity)
            .font(.customFont(type: .semiBold,
                              size: 20))
            .foregroundColor(.gray)
            .padding(.horizontal, 16)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
