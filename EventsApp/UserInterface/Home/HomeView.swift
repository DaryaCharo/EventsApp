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
                eventsList
            }
        }
                   .padding(.top)
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
            Text("Сегодняшние события")
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
                            CurrentEventView(event: result.object)
                                .padding(.bottom)
                        }
                    }
                } else {
                    Text("События не найдены")
                        .font(.customFont(type: .semiBold,
                                          size: 20))
                        .frame(maxWidth: .infinity,
                               alignment: .center)
                        .padding()
                }
            }
            .frame(maxWidth: .infinity,
                   alignment: .center)
        }
    }
    
    private var header: some View {
        HStack {
            HeaderWithLogo(title: "Главная")
            
            Spacer()
            
            CustomButton(type: .notification)
            
            FavouriteButton(type: .favouriteView)
            
            CustomButton(type: .search)
                .padding(.trailing)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
