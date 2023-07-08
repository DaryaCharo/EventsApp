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
        ScrollView(.vertical,
                   showsIndicators: false) {
            VStack {
                header
                
                featureEvent
                
                listOfEvents
                
                eventsList
            }
        }
                   .padding(.top)
                   .fullScreenCover(item: $vm.showView) { event in
                       FavouriteView()
                   }
                   .task {
                       await vm.getEvents()
                   }
    }
    
    private var featureEvent: some View {
        FeaturedEventsView(vm: vm,
                           title: .constant(vm.featuredEvent?.title ?? ""),
                           eventImage: .constant(vm.featuredEvent?.images?.image ?? ""))
    }
    
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
                            EventView(currentEvent: result.object,
                                      type: .current)
                                .padding(.bottom)
                        }
                    }
                } else {
                    Text("Can't find any events on this day")
                        .font(.customFont(type: .semiBold,
                                          size: 20))
                        .frame(maxWidth: .infinity,
                               alignment: .center)
                        .padding()
                }
            }
        }
    }
    
    private var header: some View {
        HStack {
            HeaderWithLogo(title: "Home")
            
            Spacer()
            
            CustomButton(type: .notification)
            
            Button {
                vm.showView = .favourite
            } label: {
                Image(systemName: "bookmark.fill")
                    .foregroundColor(.customPurple)
            }
            .buttonStyle(UserInteractionButtonsStyle())
            
            CustomButton(type: .search)
                .padding(.trailing)
        }
    }
    
    private var listOfEvents: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(vm.categories, id: \.id) { category in
                    
                    Button {
                        //show current type
                    } label: {
                        Text(category.name ?? "none")
                    }
                    .padding(5)
                    .buttonStyle(BorderedButtonStyle())
                    .foregroundColor(.customPurple)
                }
            }
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
