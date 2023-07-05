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
        ScrollView(.vertical) {
            VStack {
                header
                listOfEvents
            }
        }
        .task {
            if vm.results.isEmpty {
                await vm.fillResults()
            }
        }
    }
    
    private var listOfEvents: some View {
        VStack {
            if vm.results.contains(where: {$0.object != nil}) {
                VStack {
                    ForEach(vm.results, id: \.object?.id) { result in
                        if let imageLink = result.object?.images?.image,
                           let title = result.object?.title,
                           let type = result.object?.type,
                           let followers = result.object?.favouritesCount,
                           let address = result.object?.place?.address,
                           let date = result.date
                        {
                            EventView(imageLink: imageLink,
                                      eventTitle:  title,
                                      genre: type,
                                      followers:  followers,
                                      location: address,
                                      stringDate: date)
                            .padding(.bottom)
                        }
                    }
                }
            } else {
                Text("Can't find any events")
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
                HeaderWithLogo(title: "Event List")
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
