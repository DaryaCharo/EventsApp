//
//  SignUp.swift
//  EventsApp
//
//  Created by Darya Charniankova on 16.06.23.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var vm = AuthVM()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack {
                LogoView()
                    .padding(20)
                
                Text("Create your new account")
                    .font(.customFont(type: .semiBold,
                                      size: 20))
                formFields
                    .padding(.vertical)
                signUpButton
                    .padding()
                
                Spacer()
                
                signUpLink
                    .padding(.vertical)
            }
        }
        .fullScreenCover(item: $vm.showView) { view in
            TabBarView()
        }
    }
    
    private var signUpButton: some View {
        Button {
            signUp()
            if vm.providers.userSession != nil {
                vm.showView = .startPage
            }
        } label: {
            Text("Sign Up")
                .font(.customFont(type: .semiBold,
                                  size: 18))
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(FillButtonStyle())
        .padding(.horizontal)
    }
    //если выносить таск на рутовую вью, то signUp срабатывает на link, то есть не на нужную кнопку, а на ссылку
    private func signUp() {
        Task {
            await vm.signUp()
        }
    }
    
    private var signUpLink: some View {
        Button {
            dismiss()
        } label: {
            HStack {
                Text("Already have an account? ") +
                Text("Sign In").foregroundColor(.customPurple)
                    .bold()
            }
            .frame(maxWidth: .infinity)
            .font(.customFont(type: .semiBold,
                              size: 20))
            .foregroundColor(.gray)
            .padding(.horizontal)
        }
    }
    
    private var formFields: some View {
        VStack {
            InputFieldView(title: InputFieldText.email.title,
                           placeholder: InputFieldText.email.placeholder,
                           text: $vm.email)
            InputFieldView(title: InputFieldText.fullname.title,
                           placeholder: InputFieldText.fullname.placeholder,
                           text: $vm.fullname)
            InputFieldView(title: InputFieldText.pass.title,
                           placeholder: InputFieldText.pass.placeholder,
                           text: $vm.pass,
                           isSecureField: .secure)
            InputFieldView(title: InputFieldText.confirmPass.title,
                           placeholder: InputFieldText.confirmPass.placeholder,
                           text: $vm.confPass,
                           isSecureField: .secure)
        }
    }
    
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
