//
//  TextFieldView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 22.06.23.
//

import SwiftUI

struct InputFieldView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    var isSecureField: FieldType = .text
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(title)
                .font(.customFont(type: .semiBold,
                                       size: 14))
                .foregroundColor(.gray)
                .padding(.leading)
            
            switch isSecureField {
            case .secure:
                SecureField(placeholder, text: $text)
                    .font(.customFont(type: .regular,
                                           size: 16))
                    .autocapitalization(.none)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 16)
                    .background(Color.customWindowBack)
                    .cornerRadius(24)
                    .padding(.horizontal)
            case .text:
                TextField(placeholder, text: $text)
                    .font(.customFont(type: .regular,
                                           size: 16))
                    .autocapitalization(.none)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 16)
                    .background(Color.customWindowBack)
                    .cornerRadius(24)
                    .padding(.horizontal)
            }
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        InputFieldView(title: "Filed Name",
                      placeholder: "Placeholder",
                      text: .constant(""))
    }
}

enum FieldType {
    case secure, text
}

enum InputFieldText {
    case email, nickname, pass, confirmPass
    
    var title: String {
        switch self {
        case .email:
            return "Email"
        case .nickname:
            return "Full name"
        case .pass:
            return "Password"
        case .confirmPass:
            return "Confirm password"
        }
    }
    
    var placeholder: String {
        switch self {
        case .email:
            return "Enter your email"
        case .nickname:
            return "Enter your first name or create a nickname"
        case .pass:
            return "Enter your password"
        case .confirmPass:
            return "Confirm your password"
        }
    }
}
