//
//  ProfileErrors.swift
//  EventsApp
//
//  Created by Darya Charniankova on 17.07.23.
//

import SwiftUI

struct ProfileErrors: View {
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
        case incorrectBio, email, fullName, emptyField
        
        var getErrorMessage: String {
            switch self {
            case .incorrectBio:
                return "Поле с информацией заполнено некорректно"
            case .email:
                return "Поле с почтой заполнено некорректно"
            case .fullName:
                return "Поле с именем заполнено некорректно"
            case .emptyField:
                return "Поле не может оставаться пустым"
            }
        }
    }
}

struct ProfileErrors_Previews: PreviewProvider {
    static var previews: some View {
        ProfileErrors(type: .incorrectBio)
    }
}
