//
//  EditProfileView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 22.06.23.
//

import SwiftUI

struct EditProfileView: View {
    @StateObject var vm = ProfileVM()
    @Binding var id: String
    @Binding var email: String
    @Binding var name: String

    var body: some View {
        VStack {
            HeaderWithBackBtn(title: "Edit profile")
            
            userInfo
            
            Spacer()
        }
    }
    
    private var userInfo: some View {
        VStack {
            InputFieldView(title: "ID",
                           placeholder: id,
                           text: $id)
            InputFieldView(title: "Full name",
                           placeholder: name,
                           text: $name)
            InputFieldView(title: "Email",
                           placeholder: email,
                           text: $email)
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(id: .constant(""),
                        email: .constant(""),
                        name: .constant(""))
    }
}
