//
//  EventNoteView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 18.06.23.
//

import SwiftUI

struct EventNoteView: View {
    var body: some View {
        VStack {
            HStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .padding(.leading, 10)
                Text("Event List")
                    .font(.customFont(type: .semiBold,
                                      size: 24))
                    .padding(.leading, 5)
                Spacer()
                
                CustomButton(type: .search)
                    .padding(.trailing)
                    .buttonStyle(UserInteractionButtonsStyle())
            }
        }
    }
}

struct EventNoteView_Previews: PreviewProvider {
    static var previews: some View {
        EventNoteView()
    }
}
