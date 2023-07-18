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
                return "Please fill the email field correctly"
            case .fullName:
                return "Please fill the name field correctly"
            case .pass:
                return "Password need to be more than 5 characters"
            case .confPass:
                return "Password is not correct"
            case .emptyField:
                return "Text filed can't be empty"
            }
        }
    }
}

struct SignInAndUpErrors_Previews: PreviewProvider {
    static var previews: some View {
        SignInAndUpErrors(type: .email)
    }
}
