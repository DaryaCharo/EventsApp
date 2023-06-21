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
            
            searchAndFilter
            
            featureEvent
            
            eventsList
        }
    }
    
    private var featureEvent: some View {
        FeaturedEventsView(title: "Feature Event",
                           eventImage: "")
    }
    
    private var eventsList: some View {
        VStack {
            ScrollView {
                if vm.results.contains(where: {$0.object != nil}) {
                    ForEach(vm.results, id: \.object?.id) { object in
                        if let link = object.object?.images?.image,
                           let title = object.object?.title,
                           let type = object.object?.type,
                           let followers = object.object?.favouritesCount,
                           let location = object.city,
                           let date = object.date
                        {
                            EventView(imageLink: link,
                                      eventTitle:  title,
                                      genre: type,
                                      followers:  followers,
                                      location: location,
                                      date: date)
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
            vm.getEvents()
        }
    }
    
    private var header: some View {
        HStack {
            Image("Logo")
                .resizable()
                .frame(width: 35, height: 35)
                .padding(.leading, 10)
            
            
            Text("Home")
                .font(.customFont(type: .semiBold,
                                  size: 24))
                .padding(.leading, 5)
            
            Spacer()
            
            CustomButton(type: .notification)
                .buttonStyle(UserInteractionButtonsStyle())
                .fullScreenCover(item: $vm.showView) { item in
                    switch item {
                    case .notification:
                        NotificationView()
                    case .favourite:
                        FavouriteView()
                    }
                }
            CustomButton(type: .favourite)
                .buttonStyle(UserInteractionButtonsStyle())
                .fullScreenCover(item: $vm.showView) { item in
                    switch item {
                    case .notification:
                        NotificationView()
                    case .favourite:
                        FavouriteView()
                    }
                }
        }
        .padding()
    }
    
    private var searchAndFilter: some View {
        VStack {
            VStack {
                
                HStack {
                    TextField("Search",
                              text: $vm.searchText)
//                    .searchable(text: $vm.searchText)
                    .padding()
                    .background(Color.customWindowBack)
                    .cornerRadius(30)
                    
                    
                    CustomButton(type: .search)
                }
                .padding()
                
            }
        }
    }
    
    private var listOfEvents: some View {
        ScrollView {
            ForEach(vm.categories, id: \.id) { category in
                Button {
                    vm.getEventWithCategory(category: category.name ?? "")
                } label: {
                    Text(category.name ?? "")
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//        VStack {
//            if vm.results.contains(where: {$0.object != nil}) {
//
//                //через секцию. контент header footer. Когда появляется footer
//                //если hasMore loadMore - fetchData
//
//                List {
//                    ForEach(vm.results, id: \.object?.id) { event in
//                        if let link = event.object?.images?.image,
//                           let title = event.object?.title,
//                           let type = event.object?.type,
//                           let followers = event.object?.favouritesCount,
//                           let location = event.city,
//                           let date = event.date
//                        {
//                            EventView(imageLink: link,
//                                      eventTitle:  title,
//                                      genre: type,
//                                      followers:  followers,
//                                      location: location,
//                                      date: date)
//
//                        } else {
//                            Text("Can't find any events")
//                                .font(.customFont(type: .semiBold,
//                                                  size: 20))
//                        }
//                    }
//                }
//                .task {
//                    vm.getEvents()
//                }
//            }
