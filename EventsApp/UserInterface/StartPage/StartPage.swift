//
//  ContentView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 6.06.23.
//

import SwiftUI

struct StartPage: View {
    @StateObject var vm = AuthVM()
    
    var body: some View {
        VStack {
            if vm.providers.userSession != nil{
                TabBarView()
            } else {
                SignInView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartPage()
    }
}
