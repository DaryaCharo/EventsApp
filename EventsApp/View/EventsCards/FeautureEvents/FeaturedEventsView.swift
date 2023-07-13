//
//  FeaturedEvents.swift
//  EventsApp
//
//  Created by Darya Charniankova on 15.06.23.
//

import SwiftUI
import Kingfisher

struct FeaturedEventsView: View {
    @StateObject var vm = HomeVM()
    @Binding var title: String
    @Binding var eventImage: String
    @State var showInfo: ShowInfo?
    
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
        .fullScreenCover(item: $showInfo) { view in
            FullCurrentEventView(event: vm.featuredEvent,
                                 isFavourite: $vm.isFavourite)
        }
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
            showInfo = .fullInfoView
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
        FeaturedEventsView(title: .constant(""),
                           eventImage: .constant(""))
    }
}

enum ShowInfo: Identifiable {
    case fullInfoView
    
    var id: Int {
        return 1
    }
}
