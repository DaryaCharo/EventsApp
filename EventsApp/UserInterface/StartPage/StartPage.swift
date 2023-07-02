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
            if vm.userSession != nil{
                HomeView()
            } else {
                SignInView()
            }
            
//            vm.userSession != nil ? HomeView() : SignInView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartPage()
    }
}
