//
//  HomeView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 14.06.23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeVM()
    
    var body: some View {
        VStack {
            header
            
            featureEvent
            
            listOfEvents
            
            eventsList
        }
    }
    
    private var featureEvent: some View {
        
        FeaturedEventsView(title: "Feature Event",
                           eventImage: "")
        
    }
    
    //                //через секцию. контент header footer. Когда появляется footer
    //                //если hasMore loadMore - fetchData
    private var eventsList: some View {
        VStack {
            Text("Today's Events")

                .font(.customFont(type: .semiBold,
                                  size: 25))
                .frame(maxWidth: .infinity,
                       alignment: .leading)
                .padding()
            
            ScrollView(.horizontal,
                       showsIndicators: false) {
                if vm.results.contains(where: {$0.object != nil}) {
                    HStack {
                        ForEach(vm.results, id: \.object?.id) { result in
                            if let imageLink = result.object?.images?.image,
                               let title = result.object?.title,
                               let type = result.object?.type,
                               let followers = result.object?.favouritesCount,
                               let address = result.object?.place?.address,
                               let date = result.date
                            {
                                EventView(imageLink: imageLink,
                                          eventTitle:  title,
                                          genre: type,
                                          followers:  followers,
                                          location: address,
                                          date: date)
                                .padding(.bottom)
                            }
                        }
                    }
                } else {
                    Text("Can't find any events")
                        .font(.customFont(type: .semiBold,
                                          size: 20))
                }
            }
        }
        .task {
            await vm.fillResults()
            await vm.getEventWithCategory()
        }
    }
    
    private var header: some View {
        HStack {
            Header(title: "Home")
            
            Spacer()
            
            CustomButton(type: .notification)
                .buttonStyle(UserInteractionButtonsStyle())
            //                .fullScreenCover(item: $vm.showView) { item in
            //                    switch item {
            //                    case .notification:
            //                        NotificationView()
            //                    case .favourite:
            //                        FavouriteView()
            //                    }
            CustomButton(type: .favourite)
                .buttonStyle(UserInteractionButtonsStyle())
                .padding(.trailing)
        }
    }
    
    private var listOfEvents: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(vm.categories, id: \.id) { category in
                    
                    Button {
                        
                    } label: {
                        Text(category.name ?? "none")
                    }
                    .padding(5)
                    .buttonStyle(BorderedButtonStyle())
                    .foregroundColor(.customPurple)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
