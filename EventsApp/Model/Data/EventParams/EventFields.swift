//
//  PlacesID.swift
//  EventsApp
//
//  Created by Darya Charniankova on 8.06.23.
//

import Foundation

struct EventFields: Decodable {
    let id: Int  //идентификатор
    let publicationDate: Date // дата публикации
    let dates: Dates // даты проведения
    let title: String // название
    let shortTitle: String // короткое название
    let slug: String // слаг
    let place: String // адрес проведения
    let description: String // описание
    let bodyText: String // полное описание
    let location: String // город проведения
    let categories: Categories // список категорий
    let tagline: String // тэглайн
    let ageRestriction: Int // возрастное ограничение
    let price: String // к цене идёт описание - "от 1200 до 2400 рублей в абонементе" - как пример
    let isFree: Bool  // бесплатное ли событие
    let images: [EventImages]  // картинки
    let favouriteCount: Int  //сколько пользователей добавило событие в избранное
    
    enum CodingKeys: String, CodingKey {
        case id, dates, title, slug, place, description, location, categories, tagline, price, images,
             publicationDate = "publication_date",
             shortTitle = "short_title",
             bodyText = "body_text",
             ageRestriction = "age_restriction",
             isFree = "is_free",
             favouriteCount = "favorites_count"
    }
}
