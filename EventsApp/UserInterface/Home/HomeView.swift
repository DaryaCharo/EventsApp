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
    
    //                //через секцию. контент header footer. Когда появляется footer
    //                //если hasMore loadMore - fetchData
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
                            .padding(.bottom)
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
            vm.fillResults()
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
    
    private var searchAndFilter: some View {
        HStack {
            TextField("Search",
                      text: $vm.searchText)
            .searchable(text: $vm.searchText)
            .padding()
            .background(Color.customWindowBack)
            .cornerRadius(30)
            
            CustomButton(type: .search)
        }
        .padding()
        
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
