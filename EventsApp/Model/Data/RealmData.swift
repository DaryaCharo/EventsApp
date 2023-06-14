//
//  RealmData.swift
//  EventsApp
//
//  Created by Darya Charniankova on 12.06.23.
//

import Foundation
import RealmSwift

class RealmData: Object {
    
    @Persisted var id: Int
    @Persisted var name: String
    @Persisted var eventDescription: String
    @Persisted var location: String //сделать структуру отдельную локации где будут прописаны адрес телефон и прочее как отдельная таблица? 
    @Persisted var category: String
    @Persisted var dates: String //аналогично локации начало конец
    @Persisted var images: String //массив урлов?
    
    convenience init(id: Int,
                     name: String,
                     eventDescription: String,
                     location: String,
                     category: String,
                     dates: String,
                     images: String) {
        self.init()
        self.id = id
        self.name = name
        self.eventDescription = eventDescription
        self.location = location
        self.category = category
        self.dates = dates
        self.images = images
    }
}
