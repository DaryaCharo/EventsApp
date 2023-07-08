//
//  EventFullInfoView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 2.07.23.
//

import SwiftUI
import Kingfisher

struct FullEventInfoView: View {
    @State private var showMap: ShowMap?
    @State var isFavourite = false
    @State var currentEvent: CurrentEvent?
    @State var eventFromList: ListEvent?
    @State var type: EventType?
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .topLeading) {
                    KFImage(URL(string: type == .current ?
                                currentEvent?.images?.image ?? "Image" :
                                    eventFromList?.images?.image ?? "Image"))
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity)
                    
                    CustomButton(type: .back)
                        .padding(3)
                        .background(Color.white.opacity(0.9))
                        .shadow(radius: 0.1)
                        .clipShape(Circle())
                        .padding([.leading, .top])
                }
                .frame(maxWidth: .infinity,
                       maxHeight: 250,
                       alignment: .top)
                
                title
                fullInfo
            }
        }
    }
    
    private var title: some View {
        VStack {
            HStack {
                Text(type == .current ?
                     currentEvent?.type ?? "event" :
                     eventFromList?.categories?.first?.name ?? "event")
                    .padding(5)
                    .overlay {
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(lineWidth: 2)
                    }
                    .foregroundColor(.customPurple)
                
                Spacer()
                
                Text(type == .current ?
                     currentEvent?.favouritesCount?.description ?? "0" :
                     eventFromList?.favouritesCount?.description ?? "0")
                Text("Going")
            }
        
            HStack {
                Text(type == .current ?
                    currentEvent?.title ?? "Title" :
                    eventFromList?.title ?? "Title")
                    .font(.title)
                    .bold()
                
                Spacer()
            }
            .padding(.top)
        }
        .padding()
    }
    
    private var fullInfo: some View {
        VStack {
            date
            address
            aboutEvent
            shareAddToFavourite
        }
        .padding(.horizontal)
    }
    
    private var aboutEvent: some View {
        VStack {
            Text(type == .current ?
                 currentEvent?.description ?? "Can't find any information" :
                 eventFromList?.description ?? "Can't find any information")
                .frame(maxWidth: .infinity,
                       alignment: .leading)
            Text(type == .current ?
                 currentEvent?.ageRestriction ?? "" :
                 eventFromList?.ageRestriction ?? "")
                .frame(maxWidth: .infinity,
                       alignment: .leading)
        }
        .padding(.vertical)
    }
    
    private var shareAddToFavourite: some View {
        HStack(spacing: 20) {
            Button {
//                ShareLink(item: event?.place?.officialSiteLink ?? "",
//                          subject: Text(event?.title ?? "Title event"))
                
            } label: {
                Image(systemName: "link")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.customPurple)
                    .padding()
                    .background(Color.customPurple.opacity(0.2))
                    .clipShape(Circle())
            }
            
            Button {
                isFavourite.toggle()
            } label: {
                Image(systemName: isFavourite ? "bookmark.fill" : "bookmark")
                    .resizable()
                    .frame(width: 15, height: 25)
                    .foregroundColor(.customPurple)
                    .padding()
                    .background(Color.customPurple.opacity(0.2))
                    .clipShape(Circle())
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
    
    private var date: some View {
        HStack(spacing: 20) {
            Image("Calendar")
                .padding(24)
                .background(Color.customPurple.opacity(0.2))
                .clipShape(Circle())
            
            VStack {
                Text(type == .current ?
                     currentEvent?.dateRange?.start?.description ?? "Date is unknown" :
                     eventFromList?.dates?.first?.start?.description ?? "Date is unknown")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                
                //add event to calendar
                Button {
                    
                } label: {
                    Text("Add to My Calendar")
                        .font(.headline)
                        .padding(5)
                }
                .buttonStyle(BorderedButtonStyle())
                .foregroundColor(.customPurple)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
            }
        }
        .padding(.vertical)
    }
    
    private var address: some View {
        HStack(spacing: 20) {
            Image("MapMarker")
                .resizable()
                .frame(width: 20, height: 24)
                .padding(24)
                .background(Color.customPurple.opacity(0.2))
                .clipShape(Circle())
            
            VStack {
                Text(type == .current ?
                     currentEvent?.place?.address ?? "Address has not been added yet" :
                     eventFromList?.place?.address ?? "Address has not been added yet")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                
                Label {
                    Text(type == .current ?
                         currentEvent?.place?.subway ?? "Subway has not been added yet" :
                            eventFromList?.place?.subway ?? "Subway has not been added yet")
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                } icon: {
                    Image(systemName: "m.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.customPurple)
                }
                //move to map
                Button {
                    showMap = .map
                } label: {
                    Text("See on Map")
                        .font(.headline)
                        .padding(5)
                }
                .buttonStyle(BorderedButtonStyle())
                .foregroundColor(.customPurple)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
            }
        }
        .padding(.vertical)
        .sheet(item: $showMap) { _ in
            MapView(type: type,
                    lat: type == .current ?
                        currentEvent?.place?.coords?.lat ??
                        CitiesCoordinates.moscow.latitude :
                        eventFromList?.place?.coords?.lat ??
                        CitiesCoordinates.moscow.latitude,
                    lon: type == .current ?
                        currentEvent?.place?.coords?.lon ??
                        CitiesCoordinates.moscow.longitude :
                        eventFromList?.place?.coords?.lon ??
                        CitiesCoordinates.moscow.longitude)
        }
    }
    
    enum ShowMap: Identifiable {
        case map
        
        var id: Int {
            return 1
        }
    }
}

struct FullEventInfoView_Previews: PreviewProvider {
    static var previews: some View {
        FullEventInfoView(currentEvent: .none,
                          type: .current)
    }
}
