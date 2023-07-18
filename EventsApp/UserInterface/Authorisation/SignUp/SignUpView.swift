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
            //email
            InputFieldView(title: InputFieldText.email.title,
                           placeholder: InputFieldText.email.placeholder,
                           text: $vm.email)
            CheckSignInAndUp(vm: vm,
                            checkTextField: .email)
            //fullName
            InputFieldView(title: InputFieldText.fullName.title,
                           placeholder: InputFieldText.fullName.placeholder,
                           text: $vm.fullName)
            CheckSignInAndUp(vm: vm,
                            checkTextField: .fullName)
            //Password
            InputFieldView(title: InputFieldText.pass.title,
                           placeholder: InputFieldText.pass.placeholder,
                           text: $vm.pass,
                           isSecureField: .secure)
            CheckSignInAndUp(vm: vm,
                            checkTextField: .pass)
            //conf Pass
            ZStack(alignment: .bottomTrailing) {
                InputFieldView(title: InputFieldText.confirmPass.title,
                               placeholder: InputFieldText.confirmPass.placeholder,
                               text: $vm.confPass,
                               isSecureField: .secure)
                CheckSignInAndUp(vm: vm,
                                checkTextField: .confPass)
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
        !vm.fullName.trimmingCharacters(in: .whitespaces).isEmpty &&
        vm.fullName.range(of: vm.fullNameRegex,
                             options: .regularExpression) != nil &&
        vm.email.range(of: vm.emailRegex,
                       options: .regularExpression) != nil &&
        !vm.pass.trimmingCharacters(in: .whitespaces).isEmpty &&
        vm.pass.count > 5 &&
        vm.confPass == vm.pass ? .accepted : .denied
    }
}


