//
//  CustomButtonVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 18.06.23.
//

import SwiftUI

final class CustomButtonVM: ObservableObject {
    @Published var isFavourite = false
    
    func makeFavourite() {
        
        isFavourite.toggle()
        
        //add to favourite list
    }
}
