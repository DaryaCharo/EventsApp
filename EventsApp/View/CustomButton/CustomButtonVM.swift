//
//  CustomButtonVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 18.06.23.
//

import SwiftUI

final class CustomButtonVM: ObservableObject {
    @Published var showView: ShowView?
    
    enum ShowView: Identifiable  {
        case settings, notification, search
        var id: Int {
            switch self {
            case .notification:
                return 1
            case .settings:
                return 2
            case .search:
                return 3
            }
        }
    }
}

enum ButtonType {
    case back, settings, notification, search
}
