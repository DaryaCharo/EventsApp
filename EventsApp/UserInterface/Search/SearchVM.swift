//
//  SearchVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 8.07.23.
//

import Foundation

final class SearchVM: ObservableObject {
    @Published var results: [ListEvent] = []
}
