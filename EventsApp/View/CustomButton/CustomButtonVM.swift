//
//  CustomButtonVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 18.06.23.
//

import SwiftUI

final class CustomButtonVM: ObservableObject {
    @Published var isFavourite = false
    @Published var showView: ButtonType?
    
    func makeFavourite() {
        isFavourite.toggle()
        
        //add to favourite list
    }
}

enum ButtonType: Identifiable {
    case back, settings, notification, favourite, search, filter, navigation, changePhoto
//}
    var id: Int {
        switch self {
        case .notification:
            return 1
        case .favourite:
            return 2
        case .back:
            return 3
        case .settings:
            return 4
        case .search:
            return 5
        case .filter:
            return 6
        case .navigation:
            return 7
        case .changePhoto:
            return 8
        }
    }
}
