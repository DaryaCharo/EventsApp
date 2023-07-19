//
//  ErrorsUnderFields.swift
//  EventsApp
//
//  Created by Darya Charniankova on 17.07.23.
//

import SwiftUI

struct SignInAndUpErrors: View {
    @State var type: ErrorTypes
    
    var body: some View {
        Text(type.getErrorMessage)
            .font(.caption)
            .frame(maxWidth: .infinity,
                   alignment: .leading)
            .foregroundColor(.customRed)
            .padding(.horizontal)
            
    }
    
    enum ErrorTypes {
        case email, fullName, pass, confPass, emptyField
        
        var getErrorMessage: String {
            switch self {
            case .email:
                return "Поле с почтой заполнено некорректно "
            case .fullName:
                return "Поле с именем заполнено некорректно"
            case .pass:
                return "Пароль должен содержать больше 5 символов"
            case .confPass:
                return "Пароль введён неверно"
            case .emptyField:
                return "Поле не может оставаться пустым"
            }
        }
    }
}

struct SignInAndUpErrors_Previews: PreviewProvider {
    static var previews: some View {
        SignInAndUpErrors(type: .email)
    }
}
