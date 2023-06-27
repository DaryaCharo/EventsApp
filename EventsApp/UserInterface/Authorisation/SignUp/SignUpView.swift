//
//  SignUp.swift
//  EventsApp
//
//  Created by Darya Charniankova on 16.06.23.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var vm = SignUpVM()
    
    var body: some View {
        registrationFields
        
        signInLink
    }
    
    private var signInLink: some View {
        NavigationLink {
            SignInView()
        } label: {
            HStack {
                Text("Already have an account? ") +
                Text("Sign Up").foregroundColor(.customPurple)
            }
            .frame(maxWidth: .infinity)
            .font(.customFont(type: .semiBold,
                              size: 20))
            .foregroundColor(.gray)
            .padding(.horizontal, 16)
        }
    }
    
    private var registrationFields: some View {
        VStack {
            TextFieldView(textFieldName: TextFieldText.email.textFieldName,
                          placeholder: TextFieldText.email.placeholder,
                          text: $vm.email)
            TextFieldView(textFieldName: TextFieldText.pass.textFieldName,
                          placeholder: TextFieldText.pass.placeholder,
                          text: $vm.pass)
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
