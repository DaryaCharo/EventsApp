//
//  EventView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 15.06.23.
//

import SwiftUI
import Kingfisher

struct EventView: View {
    @StateObject var vm = EventVM()
    @State var imageLink: String
    @State var eventTitle: String
    @State var genre: String
    @State var followers: Int
    @State var location: String
    @State var date: String
    
    var body: some View {
        ZStack {
            if let url = URL(string: imageLink) {
            KFImage(url)
                    .resizable()
                    .frame(maxWidth: 150,
                           maxHeight: 100)
            
//            Image(uiImage: vm.image)
                
            
            Spacer()
            
                VStack {
                    
                    Text(date)
                        .font(.customFont(type: .regular,
                                          size: 18))
                        .padding(10)
                        .foregroundColor(.customPurple)
                        .background(Color.dateBack)
                        .cornerRadius(10)
                        .padding()
                        .frame(maxWidth: .infinity,
                               alignment: .trailing)
                    
                    eventInfo
                }
            }
        }
        .background(Color.customWindowBack)
        .cornerRadius(20)
        .shadow(radius: 10)
        .frame(maxWidth: .infinity)
        .padding()
        .task {
//            vm.getImage(link: imageLink)
        }
    }
    
    private var eventInfo: some View {
        VStack {
            
            Text(eventTitle)
                .font(.customFont(type: .bold,
                                  size: 25))
                .frame(maxWidth: .infinity,
                       alignment: .leading)
            
            HStack {
                Text(genre)
                    .font(.customFont(type: .regular,
                                      size: 18))
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 2)
                    }
                    .foregroundColor(.customPurple).opacity(0.8)
                    .padding([.top, .bottom], 8)
                
                Text("\(followers)")
                    .padding(.leading, 8)
                Text(" Going")
            }
            .frame(maxWidth: .infinity,
                   alignment: .leading)
            
            HStack {
                Label {
                    Text(location)
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
        .padding(30)
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
