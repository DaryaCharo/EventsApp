//
//  EventView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 15.06.23.
//

import SwiftUI
import Kingfisher

struct EventView: View {
    @State var imageLink: String
    @State var eventTitle: String
    @State var genre: String
    @State var followers: Int
    @State var location: String
    @State var date: String
    
    var body: some View {
        ZStack {
            KFImage(URL(string: imageLink))
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
            VStack {
                Spacer()
                Rectangle()
                    .foregroundColor(.customWindowBack)
                    .frame(maxWidth: .infinity, maxHeight: 100)
            }
                VStack {
                    eventInfo
                }
            }
        
        .background(Color.customWindowBack)
        .cornerRadius(20)
        .shadow(radius: 1)
        .frame(maxWidth: 300,
               maxHeight: 350)
        .padding()
    }
    
    private var eventInfo: some View {
        VStack {
            Text(date)
                .font(.customFont(type: .regular,
                                  size: 16))
                .padding(10)
                .foregroundColor(.customPurple)
                .background(Color.dateBack)
                .cornerRadius(10)
                .frame(maxWidth: .infinity,
                       alignment: .trailing)
            
            Spacer()
            
            Text(eventTitle)
                .font(.customFont(type: .bold,
                                  size: 16))
                .lineLimit(3)
                .frame(maxWidth: .infinity,
                       maxHeight: 50,
                       alignment: .leading)
                .padding(.top)
            
            HStack {
                Text(genre)
                    .font(.customFont(type: .regular,
                                      size: 16))
                    .padding(8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 2)
                    }
                    .foregroundColor(.customPurple).opacity(0.8)
                
                Text("\(followers)")
                    .font(.customFont(type: .regular,
                                      size: 16))
                    .padding(.leading, 8)
                Text(" Going")
                    .font(.customFont(type: .regular,
                                      size: 16))
            }
            .frame(maxWidth: .infinity,
                   alignment: .leading)
            
            HStack {
                Label {
                    Text(location)
                        .font(.customFont(type: .regular,
                                          size: 16))
                } icon: {
                    Image("MapMarker")
                        .resizable()
                        .frame(width: 14,
                               height: 18)
                }
                
                Spacer()
                
                CustomButton(type: .favourite)
            }
        }
        .padding([.leading, .trailing], 30)
        .padding(.bottom, 18)
        .padding(.top, 50)
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(imageLink: "",
                  eventTitle: "Title",
                  genre: "Genre",
                  followers: 0,
                  location: "Location",
                  date: "dd, MM")
    }
}
