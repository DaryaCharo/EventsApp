//
//  EventCalendarView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 14.06.23.
//

import SwiftUI

struct EventCalendarView: View {
    @StateObject private var vm = EventCalendarVM()
    
    var body: some View {
        ScrollView {
            VStack {
                header
                calendar
                listOfEventsOnCurrentDate
            }
        }
        .padding(.top)
        .task {
            await vm.getEvents()
        }
    }
    
    private var header: some View {
        HStack {
            HeaderWithLogo(title: "My Calendar Event")
            Spacer()
        }
        .padding(.top)
    }
    
    private var calendar: some View {
        DatePicker("Calendar",
                   selection: $vm.date,
                   displayedComponents: [.date])
            .datePickerStyle(.graphical)
            .frame(maxWidth: .infinity)
            .foregroundColor(.customPurple)
            .padding(.horizontal)
    }
    
    private var listOfEventsOnCurrentDate: some View {
        VStack {
            ScrollView(.horizontal,
                       showsIndicators: false) {
                if vm.results.contains(where: {$0.object != nil}) {
                    VStack {
                        ForEach(vm.results, id: \.object?.id) { result in
                            CurrentEventView(event: result.object)
                                .padding(.bottom)
                        }
                    }
                } else {
                    Text("Can't find any events on this day")
                        .font(.customFont(type: .semiBold,
                                          size: 20))
                        .frame(maxWidth: .infinity,
                               alignment: .center)
                        .padding()
                }
            }
        }
    }
}

struct EventCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        EventCalendarView()
    }
}
