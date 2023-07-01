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
                .padding(20)
            
            Text("Sign in to your account")
                .font(.customFont(type: .semiBold,
                                  size: 20))
            
            formFields
            signInButton
            
            Text("or continue with")
                .padding()
            
            googleButton
            
            Spacer()
            
            signUpLink
            
            Spacer()
        }
    }
    
    private var googleButton: some View {
        Button {
            Task {
                await vm.continueWithGoogle()
            }
        } label: {
            Label {
                Text("Continue with Google")
                    .font(.customFont(type: .semiBold,
                                      size: 16))
                    .foregroundColor(.black)
                    .padding(.vertical, 18)
            } icon: {
                Image("Icon - Google")
                    .frame(width: 24,
                           height: 24)
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 8)
            .background(Color.customWindowBack)
            .cornerRadius(10)
        }
    }
    
    private var signInButton: some View {
        Button {
            Task {
                await vm.continueWithEmail()
            }
        } label: {
            Text("Sign In")
                .font(.customFont(type: .semiBold,
                                  size: 18))
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(FillButtonStyle())
        .padding(.horizontal)
        .fullScreenCover(item: $vm.showView) { view in
            HomeView()
        }
    }
    
    private var formFields:some View {
        VStack {
            InputFieldView(title: InputFieldText.email.title,
                           placeholder: InputFieldText.email.placeholder,
                           text: $vm.email)
            
            InputFieldView(title: InputFieldText.pass.title,
                           placeholder: InputFieldText.pass.placeholder,
                           text: $vm.pass,
                           isSecureField: .secure)
        }
        .padding(.vertical, 16)
    }
    
    private var signUpLink: some View {
        NavigationLink {
            SignUpView()
                .navigationBarBackButtonHidden()
        } label: {
            HStack {
                Text("Don't have an account? ") +
                Text("Sign Up").foregroundColor(.customPurple)
                    .bold()
            }
            .frame(maxWidth: .infinity)
            .font(.customFont(type: .semiBold,
                              size: 20))
            .foregroundColor(.gray)
            .padding(.horizontal)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
