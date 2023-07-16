//
//  SignUp.swift
//  EventsApp
//
//  Created by Darya Charniankova on 16.06.23.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var vm = AuthVM()
    @Environment(\.dismiss) var dismiss
//    #error("create custom errors list and show errors under text fields")
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
                
                signInLink
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
        .disabled(formIsValid == .denied)
        .opacity(formIsValid == .accepted ? 1 : 0.5)
        .buttonStyle(FillButtonStyle())
        .padding(.horizontal)
    }
    //если выносить таск на рутовую вью, то signUp срабатывает на link, то есть не на нужную кнопку, а на ссылку
    private func signUp() {
        Task {
            await vm.signUp()
        }
    }
    
    private var signInLink: some View {
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
                           text: $vm.fullName)
            InputFieldView(title: InputFieldText.pass.title,
                           placeholder: InputFieldText.pass.placeholder,
                           text: $vm.pass,
                           isSecureField: .secure)
            
            ZStack(alignment: .bottomTrailing) {
                InputFieldView(title: InputFieldText.confirmPass.title,
                               placeholder: InputFieldText.confirmPass.placeholder,
                               text: $vm.confPass,
                               isSecureField: .secure)
                if !vm.pass.isEmpty && !vm.confPass.isEmpty {
                    if vm.pass == vm.confPass {
                        CheckPassView(type: .checkmark)
                        
                    } else {
                        CheckPassView(type: .xmark)
                    }
                }
            }
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

extension SignUpView: AuthFormProtocol {
    var formIsValid: ValidationStatus {
        !vm.fullName.isEmpty &&
        vm.email.range(of: vm.emailRegex,
                       options: .regularExpression) != nil &&
        !vm.pass.isEmpty &&
        vm.pass.count > 5 &&
        vm.confPass == vm.pass ? .accepted : .denied
    }
}


