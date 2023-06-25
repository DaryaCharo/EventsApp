//
//  TextFieldVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 24.06.23.
//

import Foundation
import SwiftUI

class TextFieldVM: ObservableObject {
    let textFieldName = ""
    let placeholder = ""
    @Published var text = ""
}

enum TextFieldText {
    case firstName, lastName, email, pass, confirmPass
    
    var textFieldName: String {
        switch self {
        case .firstName:
            return "First name"
        case .lastName:
            return "Last name"
        case .email:
            return "Email"
        case .pass:
            return "Password"
        case .confirmPass:
            return "Confirm password"
        }
    }
    
    var placeholder: String {
        switch self {
        case .firstName:
            return "Enter your first name"
        case .lastName:
            return "Enter your last name"
        case .email:
            return "Enter your email"
        case .pass:
            return "Enter your password"
        case .confirmPass:
            return "Confirm your password"
        }
    }
}

