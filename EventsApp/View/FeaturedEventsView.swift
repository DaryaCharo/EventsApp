//
//  FeaturedEvents.swift
//  EventsApp
//
//  Created by Darya Charniankova on 15.06.23.
//

import SwiftUI

struct FeaturedEventsView: View {
    @State var title: String
    @State var eventImage: String
    
    var body: some View {
        ZStack {
            
            Image(eventImage)
            
            VStack {
                Text(title)
                    .font(.customFont(type: .semiBold,
                                      size: 24))
                    .foregroundColor(.white)
                    .padding(.top, 30)
                    .padding(.leading, 40)
                
                Button {
                    
                } label: {
                    Text("Learn more")
                        .font(.customFont(type: .semiBold,
                                          size: 16))
                        .padding()
                }
                .buttonStyle(FillButtonStyle())
                .padding([.bottom, .leading], 30)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color.customPurple.opacity(0.3))
        .cornerRadius(30)
        .padding(16)
    }
}

struct FeaturedEvents_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedEventsView(title: "",
                           eventImage: "")
    }
}
