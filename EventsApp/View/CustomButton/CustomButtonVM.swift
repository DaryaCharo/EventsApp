//
//  CustomButtonVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 18.06.23.
//

import SwiftUI

final class CustomButtonVM: ObservableObject {
    @Published var isFavourite = false
    @Published var showView: ShowView?
    
    func makeFavourite() {
        isFavourite.toggle()
        
        //add to favourite list
    }
    
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
    case back, settings, notification, favourite, search
}
