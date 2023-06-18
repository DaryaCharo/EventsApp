//
//  ButtonsStyle.swift
//  EventsApp
//
//  Created by Darya Charniankova on 15.06.23.
//

import SwiftUI

struct UserInteractionButtonsStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 25, height: 25)
            .foregroundColor(Color.customPurple)
            .padding(5)
            .background(Color.customPurple.opacity(0.2))
            .cornerRadius(10)
        
        
    }
}

struct FillButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color.customPurple)
            .cornerRadius(30)
            .foregroundColor(.white)
            .padding(.horizontal, 24)
    }
}

struct BorderedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(5)
            .overlay {
                RoundedRectangle(cornerRadius: 24)
                    .stroke(lineWidth: 2)
            }
    }
}
