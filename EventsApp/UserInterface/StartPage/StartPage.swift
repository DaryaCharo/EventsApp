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
//            vm.isSignIn ? HomeView() : SignInView()
            HomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartPage()
    }
}
