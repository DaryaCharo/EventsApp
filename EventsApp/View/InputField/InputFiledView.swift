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
    case email, fullName, pass, confirmPass
    
    var title: String {
        switch self {
        case .email:
            return "Почта"
        case .fullName:
            return "Полное имя"
        case .pass:
            return "Пароль"
        case .confirmPass:
            return "Подтверждение пароля"
        }
    }
    
    var placeholder: String {
        switch self {
        case .email:
            return "Введите вашу почту"
        case .fullName:
            return "Введите ваше имя или создайте никнейм"
        case .pass:
            return "Введите ваш пароль"
        case .confirmPass:
            return "Подтвердите ваш пароль"
        }
    }
}
