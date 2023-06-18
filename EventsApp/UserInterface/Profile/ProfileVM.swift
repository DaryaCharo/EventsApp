//
//  ProfileVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 15.06.23.
//

import SwiftUI

final class ProfileVM: ObservableObject {
    @Published var showSettings = false
    @Published var name = "Me"
}
