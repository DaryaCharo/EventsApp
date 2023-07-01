//
//  UserData.swift
//  EventsApp
//
//  Created by Darya Charniankova on 19.06.23.
//

import Foundation

struct UserData: Identifiable, Codable {
    var id: Int
    var email: String
    var nickname: String
}

extension UserData {
    static var userData = UserData(id: 0,
                                   email: "princessaninzya@gmail.com",
                                   nickname: "Moderator")
}

