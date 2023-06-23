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
        VStack {
            HStack {
                Header(title: "My Calendar Event")
                Spacer()
            }
            
            DatePicker("Enter your birthday", selection: $vm.date)
                .datePickerStyle(.graphical)
                .frame(maxWidth: .infinity)
                .foregroundColor(.customPurple)
                .padding(.horizontal)
            
        }
    }
    
    private var listOfEventsOnCurrentDate: some View {
        VStack {
//            ForEach(, id: \.) { event in
//                
//            }
        }
    }
}

struct EventCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        EventCalendarView()
    }
}
