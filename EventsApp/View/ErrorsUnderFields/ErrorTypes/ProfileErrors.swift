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
            .font(.callout)
            .frame(maxWidth: .infinity,
                   alignment: .leading)
            .foregroundColor(.customRed)
            .padding(.horizontal)
    }
    
    enum ErrorTypes {
        case id, email, fullName, emptyField
        
        var getErrorMessage: String {
            switch self {
            case .id:
                return "Please fill the email field correctly"
            case .email:
                return "Please fill the email field correctly"
            case .fullName:
                return "Please fill the name field correctly"
            case .emptyField:
                return "Text filed can't be empty"
            }
        }
    }
}

struct ProfileErrors_Previews: PreviewProvider {
    static var previews: some View {
        ProfileErrors(type: .id)
    }
}
