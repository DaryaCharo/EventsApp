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
        }
    }
    
    private var searchAndFilter: some View {
        VStack {
            VStack {
                HStack {
                    Image("Logo")
                        .frame(maxWidth: 5)
                        .imageScale(.small)
                        .padding(.trailing, 70)
                    
                    Text("Home")
                        .font(.customFont(type: .semiBold,
                                          size: 20))
                }
                TextField("Search",
                          text: $vm.searchText)
                .padding()
            }
        }
    }
    
    private var eventsInfo: some View {
        VStack {
            //временное, ещё не убирала
            if vm.results.contains(where: {$0.object != nil}) {
                ForEach(vm.results, id: \.object?.id) { object in
                    VStack {
                        Text(object.date ?? "none")
                            .font(.customFont(type: .bold,
                                              size: 30))
                        
                        Text(object.object?.description ?? "")
                            .font(.customFont(type: .semiBold,
                                              size: 30))
                    }
                }
            } else {
                Text("Can't find any events")
                    .font(.customFont(type: .semiBold,
                                      size: 30))
            }
        }
        .task {
            vm.getEvents()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
