//
//  ProfileVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 15.06.23.
//

import SwiftUI

final class ProfileVM: ObservableObject {
    lazy  var providers: Providers = {
        Providers()
    }()
    @Published var showView: ShowView?
    
    func getName() -> String {
        guard let name = providers.currentUser?.fullname else { return "Me" }
        return name
    }
    
    enum ShowView: Identifiable {
        case editProfile
        
        var id: Int {
            return 1
        }
    }
}
