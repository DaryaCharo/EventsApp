//
//  Font + Extension.swift
//  EventsApp
//
//  Created by Darya Charniankova on 12.06.23.
//

import Foundation
import SwiftUI

extension Font {
    static func customFont(type: FontType,
                            size: Double) -> Font {
        .custom(type.getFont,
                size: size)
    }
}

enum FontType {
    case extraLight,
         light,
         regular,
         semiBold,
         bold,
         extraBold
    
    var getFont: String {
        switch self {
        case .extraLight:
            return "SourceSansPro-ExtraLight"
        case .light:
            return "SourceSansPro-Light"
        case .regular:
            return "SourceSansPro-Regular"
        case .semiBold:
            return "SourceSansPro-Semibold"
        case .bold:
            return "SourceSansPro-Bold"
        case .extraBold:
            return "SourceSansPro-Black"
        }
    }
}
