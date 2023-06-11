//
//  StartPageVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 8.06.23.
//

import SwiftUI

final class StartPageVM: ObservableObject {
    private let moyaManager = MoyaAPIManager()
    @Published var result: [EventsData] = []
    
    @Published var title = ""
    var listOfEvents = [String]()
    
    func getEvents(events: Events, params: EventFields, expand: ExpandList) async throws {
        do {
            var data = try await moyaManager.getEvents(events: .getEvents(lang: "en",
                                                                          expand: [expand.object.description,
                                                                                   expand.place.address,
                                                                                   expand.dates.start.getDate()],
                                                                          fields: [params.description,
                                                                                   params.price,
                                                                                   params.title,
                                                                                   "\(params.categories)",
                                                                                   "\(params.dates)"],
                                                                          location: "msk"))
            result += data
        } catch {
            print(error.localizedDescription)
        }
        
        //заполнение данных на странице
        ForEach(result, id: \.fields.id) { object in
            title = object.fields.title
        }
    }
}
