//
//  EventFullInfoView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 2.07.23.
//

import SwiftUI
import Kingfisher

struct FullCurrentEventView: View {
    @State private var showMap: ShowMap?
    @State var event: CurrentEvent?
    @Binding var isFavourite: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                EventImageView(imageFor: .fullInfo,
                               imageURL: event?.images?.image ?? "")
                title
                fullInfo
            }
        }
    }
    
    private var title: some View {
        VStack {
            HStack {
                Text(event?.type ?? "event")
                    .padding(5)
                    .overlay {
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(lineWidth: 2)
                    }
                    .foregroundColor(.customPurple)
                
                Spacer()
                
                Text(event?.favouritesCount?.description ?? "0")
                Text("Going")
            }
            
            HStack {
                Text(event?.title ?? "Title")
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
            Text(event?.description ?? "Can't find any information" )
                .frame(maxWidth: .infinity,
                       alignment: .leading)
            Text(event?.ageRestriction ?? "")
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
            
            FavouriteButton(type: .forFullView,
                            id: event?.id ?? 0,
                            isFavourite: $isFavourite)
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
                Text(event?.dateRange?.startDate?.description ?? "Date is unknown")
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
                Text(event?.place?.address ?? "Address has not been added yet")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                
                Label {
                    Text(event?.place?.subway ?? "Subway has not been added yet")
                        .frame(maxWidth: .infinity,
                               alignment: .leading)
                } icon: {
                    Image(systemName: "m.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.customPurple)
                }
                .padding(.bottom, 8)
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
            MapView(type: .current,
                    lat: event?.place?.coords?.lat ??
                    CitiesCoordinates.moscow.latitude,
                    lon: event?.place?.coords?.lon ??
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
        FullCurrentEventView(event: .none,
                             isFavourite: .constant(false))
    }
}
