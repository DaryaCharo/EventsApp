//
//  SearchView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 18.06.23.
//

import SwiftUI

struct SearchView: View {
    @StateObject var vm = EventNoteVM()
    @Binding var searchText: String
    @State private var listOfEventIDs: [Int] = []
    
    var body: some View {
        VStack {
            HeaderWithBackBtn(title: "Search")
            listOfResults
        }
        .searchable(text: $searchText)
        .task {
            await vm.getEvents()
        }
    }
    
    private var listOfResults: some View {
        VStack {
            if vm.results.contains(where: {$0.place != nil}) &&
                vm.results.contains(where: {$0.dates != nil}) &&
                !vm.results.contains(where: { $0.dates?.first?.isEnd ?? true }) {
                ScrollView {
                    VStack {
                        ForEach(vm.results, id: \.id) { result in
                            EventFromListView(event: result)
                                .padding(.bottom)
                        }
                    }
                }
            } else {
                Spacer()
                ResultView(type: .search)
                Spacer()
            }
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: .constant(""))
    }
}
