//
//  SearchView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 18.06.23.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    @State private var listOfEventIDs: [Int] = []
    
    var body: some View {
        VStack {
            HeaderWithBackBtn(title: "Search")
            listOfResults
        }
//        .searchable(text: $searchText,
//                    placement: .navigationBarDrawer)
    }
    
    private var listOfResults: some View {
        VStack {
            List(listOfEventIDs, id: \.self) { item in
                HStack(spacing: 0) {
                    NavigationLink {
                        HomeView()
                    } label: {
                        Text(item.description)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .listStyle(.inset)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: .constant(""))
    }
}
