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
        .task {
            vm.getEvents()
        }
    }
    
    private var searchAndFilter: some View {
        VStack {
            VStack {
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
                        .fullScreenCover(isPresented: $vm.showNotificationScreen) {
                            NotificationView()
                        }
                    
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "bookmark.fill")
                    }
                    .buttonStyle(UserInteractionButtonsStyle())
                    .fullScreenCover(isPresented: $vm.showFavouriteScreen) {
                        FavouriteView()
                    }
                    
                }
                .padding()
                
                HStack {
                    TextField("Search",
                              text: $vm.searchText)
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
