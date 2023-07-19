//
//  CheckProfile.swift
//  EventsApp
//
//  Created by Darya Charniankova on 18.07.23.
//

import SwiftUI

struct CheckProfile: View {
    @StateObject var vm = ProfileVM()
    @State var checkTextFields: TextFields
    
    var body: some View {
        VStack {
            switch checkTextFields {
            case .email:
                if !vm.email.trimmingCharacters(in: .whitespaces).isEmpty {
                    if vm.email.range(of: vm.emailRegex,
                                   options: .regularExpression) == nil {
                        ProfileErrors(type: .email)
                    }
                } else {
                    ProfileErrors(type: .emptyField)
                }
            case .fullName:
                if !vm.fullName.trimmingCharacters(in: .whitespaces).isEmpty {
                    if vm.fullName.range(of: vm.fullNameRegex,
                                         options: .regularExpression) == nil {
                        ProfileErrors(type: .fullName)
                    }
                } else {
                    ProfileErrors(type: .emptyField)
                }
            case .bio:
                if !vm.bio.trimmingCharacters(in: .whitespaces).isEmpty {
                    if vm.bio.range(of: vm.fullNameRegex,
                                    options: .regularExpression) == nil {
                        ProfileErrors(type: .incorrectBio)
                    }
                } else {
                    ProfileErrors(type: .emptyField)
                }
            }
        }
        .padding(.vertical, 5)
    }
    enum TextFields {
        case email, fullName, bio
    }
}

struct CheckProfile_Previews: PreviewProvider {
    static var previews: some View {
        CheckProfile(checkTextFields: .email)
    }
}
