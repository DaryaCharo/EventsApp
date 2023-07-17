//
//  EditProfileView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 22.06.23.
//

import SwiftUI

struct EditProfileView: View {
    @StateObject var vm = ProfileVM()
    
    var body: some View {
        VStack {
            HeaderWithBackBtn(title: "Edit profile")
                .disabled(formIsValid == .denied)
                .opacity(formIsValid == .accepted ? 1 : 0.5)
            
            userInfo
            
            saveBtn
            
            Spacer()
        }
    }
    
    private var saveBtn: some View {
        Button {
            changeInfo()
        } label: {
            Text("Save changes")
        }
        .buttonStyle(FillButtonStyle())
        .padding()
        .disabled(formIsValid == .denied)
        .opacity(formIsValid == .accepted ? 1 : 0.5)
    }
    
    func changeInfo() {
        Task {
            await vm.changeUserInfo()
        }
    }
    
    private var userInfo: some View {
        VStack {
            HStack {
                Text("ID")
                    .font(.callout)
                Text(vm.id)
                    .font(.callout)
            }
            .disabled(true)
            .opacity(0.5)
            .frame(maxWidth: .infinity,
                   alignment: .leading)
            .padding([.bottom, .leading, .trailing])
            
            InputFieldView(title: "Full name",
                           placeholder: vm.fullName,
                           text: $vm.fullName)
            CheckProfile(vm: vm,
                         checkTextFields: .fullName)
            
            InputFieldView(title: "Email",
                           placeholder: vm.email,
                           text: $vm.email)
            CheckProfile(vm: vm,
                         checkTextFields: .email)
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}

extension EditProfileView: ProfileFormProtocol {
    var formIsValid: ValidationStatus {
        vm.email.range(of: vm.emailRegex, options: .regularExpression) == nil &&
        vm.email.trimmingCharacters(in: .whitespaces).isEmpty &&
        vm.fullName.trimmingCharacters(in: .whitespaces).isEmpty &&
        vm.fullName.range(of: vm.fullNameRegex, options: .regularExpression) == nil ?
            .denied : .accepted
    }
}
