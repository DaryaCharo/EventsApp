//
//  CheckLogInAndUp.swift
//  EventsApp
//
//  Created by Darya Charniankova on 17.07.23.
//

import SwiftUI

struct CheckSignInAndUp: View {
    @StateObject var vm = AuthVM()
    @State var checkTextField: TextFields
    
    var body: some View {
        VStack {
            switch checkTextField {
            case .email:
                if !vm.email.trimmingCharacters(in: .whitespaces).isEmpty {
                    if vm.email.range(of: vm.emailRegex,
                                                  options: .regularExpression) == nil {
                        SignInAndUpErrors(type: .email)
                    }
                } else {
                    SignInAndUpErrors(type: .emptyField)
                }
            case .fullName:
                if !vm.fullName.trimmingCharacters(in: .whitespaces).isEmpty {
                    if vm.fullName.range(of: vm.fullNameRegex,
                                         options: .regularExpression) == nil {
                        SignInAndUpErrors(type: .fullName)
                    }
                } else {
                    SignInAndUpErrors(type: .emptyField)
                }
            case .pass:
                if !vm.pass.trimmingCharacters(in: .whitespaces).isEmpty &&
                    vm.pass.count < 5 {
                    SignInAndUpErrors(type: .pass)
                } else if vm.pass.trimmingCharacters(in: .whitespaces).isEmpty {
                    SignInAndUpErrors(type: .emptyField)
                }
            case .confPass:
                if !vm.pass.trimmingCharacters(in: .whitespaces).isEmpty && !vm.confPass.isEmpty {
                    if vm.pass == vm.confPass {
                        CheckPassView(type: .checkmark)
                        
                    } else {
                        CheckPassView(type: .xmark)
                    }
                }
            }
        }
        .padding(.bottom, 5)
    }
    
    enum TextFields {
        case email, fullName, pass, confPass
    }
}

struct CheckSignInAndUp_Previews: PreviewProvider {
    static var previews: some View {
        CheckSignInAndUp(checkTextField: .fullName)
    }
}
