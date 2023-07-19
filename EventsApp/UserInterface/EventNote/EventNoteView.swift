//
//  EventNoteView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 18.06.23.
//

import SwiftUI

struct EventNoteView: View {
    @StateObject var vm = EventNoteVM()
    
    var body: some View {
        ScrollView {
            VStack {
                header
                listOfEvents
            }
        }
        .task {
            await vm.getEvents()
        }
    }
    
    private var listOfEvents: some View {
        VStack {
            if vm.results.contains(where: {$0.place != nil}) {
                VStack {
                    ForEach(vm.results, id: \.id) { result in
                        EventFromListView(event: result)
                    }
                }
            } else {
                Text("Невозможно найти события")
                    .font(.customFont(type: .semiBold,
                                      size: 20))
                    .frame(maxWidth: .infinity,
                           alignment: .center)
                    .padding()
            }
        }
    }
    
    private var header: some View {
        VStack {
            HStack {
                HeaderWithLogo(title: "Список событий")
                Spacer()
                
                CustomButton(type: .search)
                    .padding(.trailing)
                    .buttonStyle(UserInteractionButtonsStyle())
            }
        }
        .padding(.top)
    }
}

struct EventNoteView_Previews: PreviewProvider {
    static var previews: some View {
        EventNoteView()
    }
}
