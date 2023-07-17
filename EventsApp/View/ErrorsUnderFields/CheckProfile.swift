//
//  CheckProfile.swift
//  EventsApp
//
//  Created by Darya Charniankova on 17.07.23.
//

import SwiftUI

struct CheckProfile: View {
    @StateObject var vm = ProfileVM()
    @State var checkTextFields: TextFields
    
    var body: some View {
        VStack {
            switch checkTextFields {
            case .id:
                if vm.id.trimmingCharacters(in: .whitespaces).isEmpty {
                    ProfileErrors(type: .emptyField)
                } else {
                    ProfileErrors(type: .id)
                }
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
            }
        }
        .padding(.bottom, 5)
    }
    
    enum TextFields {
        case id, email, fullName
    }
}

struct CheckProfile_Previews: PreviewProvider {
    static var previews: some View {
        CheckProfile(checkTextFields: .id)
    }
}
