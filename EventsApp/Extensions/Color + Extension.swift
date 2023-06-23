//
//  Color + Extension.swift
//  EventsApp
//
//  Created by Darya Charniankova on 12.06.23.
//

import Foundation
import SwiftUI

extension Color {
    static func customColor(type: CustomColors) -> Color {
        Color(type.getColor)
    }
}

enum CustomColors {
    case base, yellow
    
    var getColor: String {
        switch self {
        case .base:
            return "base"
        case .yellow:
            return "yellow"
        }
    }
}
