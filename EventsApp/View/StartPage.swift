//
//  ContentView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 6.06.23.
//

import SwiftUI

struct StartPage: View {
    
    @StateObject var vm = StartPageVM()
    
    var body: some View {
        VStack {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartPage()
    }
}
