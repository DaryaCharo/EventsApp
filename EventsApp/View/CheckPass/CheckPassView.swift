//
//  SwiftUIView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 5.07.23.
//

import SwiftUI

struct CheckPassView: View {
    @State var type: CheckStatus
    var body: some View {
        switch type {
        case .checkmark:
            Image(systemName: "checkmark.circle.fill")
                .imageScale(.large)
                .bold()
                .foregroundColor(Color(.systemGreen))
                .padding(.trailing, 30)
                .padding(.bottom, 10)
        case .xmark:
            Image(systemName: "xmark.circle.fill")
                .imageScale(.large)
                .bold()
                .foregroundColor(.customRed)
                .padding(.trailing, 30)
                .padding(.bottom, 10)
                
        }
    }
}

struct CheckPassView_Previews: PreviewProvider {
    static var previews: some View {
        CheckPassView(type: .checkmark)
    }
}

enum CheckStatus {
    case checkmark, xmark
}
