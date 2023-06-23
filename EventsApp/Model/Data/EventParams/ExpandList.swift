//
//  ExpandList.swift
//  EventsApp
//
//  Created by Darya Charniankova on 10.06.23.
//

import Foundation

struct ExpandList: Decodable {
//    let events: EventsData
    let object: CurrentEvent
    let dates: Dates
    let place: Place
    let images: EventImages
    
    //здесь небольшая загвоздка. Мне нужно разные expand создать для разных events? У них разные параметры
    enum CodingKeys: String, CodingKey {
        case object, dates, images, place	
    }
}
