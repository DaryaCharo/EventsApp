//
//  FeaturedEvents.swift
//  EventsApp
//
//  Created by Darya Charniankova on 15.06.23.
//

import SwiftUI
import Kingfisher

struct FeaturedEventsView: View {
    @State var title: String
    @State var eventImage: String
    
    var body: some View {
        ZStack {
            KFImage(URL(string: eventImage))
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
            
            VStack {
                Spacer()
                titleText
                button
            }
        }
        .background(Color.customWindowBack)
        .cornerRadius(20)
        .shadow(radius: 1)
        .frame(maxWidth: 300,
               maxHeight: 350)
        .padding()
    }
    
    private var titleText: some View {
        Text(title)
            .font(.customFont(type: .semiBold,
                              size: 18))
            .lineLimit(2)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var button: some View {
        Button {
            //go to info page
        } label: {
            Text("Learn more")
                .font(.customFont(type: .semiBold,
                                  size: 16))
                .padding(5)
        }
        .buttonStyle(FillButtonStyle())
        .padding([.bottom, .leading])
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct FeaturedEvents_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedEventsView(title: "Title",
                           eventImage: "")
    }
}
