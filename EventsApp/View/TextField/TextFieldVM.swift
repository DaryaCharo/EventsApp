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
    case email, pass, confirmPass
    
    var textFieldName: String {
        switch self {
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
        case .email:
            return "Enter your email"
        case .pass:
            return "Enter your password"
        case .confirmPass:
            return "Confirm your password"
        }
    }
}

