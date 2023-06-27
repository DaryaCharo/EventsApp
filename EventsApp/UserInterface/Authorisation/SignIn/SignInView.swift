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
            
            emailAndPass
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
        .task {
            await vm.continueWithGoogle()
        }
    }
    
    private var signInButton: some View {
        Button {
            
        } label: {
             Text("Sign In")
                .font(.customFont(type: .semiBold,
                                  size: 18))
        }
        .buttonStyle(FillButtonStyle())
    }
    
    private var emailAndPass:some View {
        VStack {
            TextFieldView(textFieldName: TextFieldText.email.textFieldName,
                          placeholder: TextFieldText.email.placeholder,
                          text: $vm.email)
            
            SecureTextFieldView(textFieldName: TextFieldText.pass.textFieldName,
                                placeholder: TextFieldText.pass.placeholder,
                                text: $vm.pass)
        }
        .padding(.vertical, 16)
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
                Text("Don't have an account? ") +
                Text("Sign Up").foregroundColor(.customPurple)
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
