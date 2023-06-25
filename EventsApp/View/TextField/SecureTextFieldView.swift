//
//  SecureTextField.swift
//  EventsApp
//
//  Created by Darya Charniankova on 24.06.23.
//

import SwiftUI

struct SecureTextFieldView: View {
    
    @StateObject var vm = TextFieldVM()
    
    let textFieldName: String
    let placeholder: String
    let text: Binding<String>
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(textFieldName)
                .font(.customFont(type: .regular,
                                       size: 12))
                .foregroundColor(.gray)
                .padding(.leading, 24)
            SecureField(placeholder, text: $vm.text)
                .font(.customFont(type: .regular,
                                       size: 16))
                
                .padding(.vertical, 14)
                .padding(.horizontal, 16)
                .background(Color.green)
                .border(Color.red)
                .cornerRadius(24)
                .padding(.horizontal, 24)
        }
    }
    var showHidePassButton: some View {
        Button {
            
        } label: {
            Image(systemName: "eye.slash.fill")
                .foregroundColor(Color("darkGray"))
        }
    }
}

struct SecureTextFiled_Previews: PreviewProvider {
    static var previews: some View {
        SecureTextFieldView(textFieldName: "Secure Fieldt",
                            placeholder: "Secure placeholder",
                            text: .constant(""))
    }
}
