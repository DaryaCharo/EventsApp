//
//  EventFullInfoView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 2.07.23.
//

import SwiftUI
import Kingfisher

struct FullEventInfoView: View {
    @Binding var event: CurrentEvent?
    @Binding var isFavourite: Bool
    
    var body: some View {
        VStack {
            ZStack {
                backButton
                
                KFImage(URL(string: event?.images?.image ?? "Image"))
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity)
            }
            .background(Color.red)
            .frame(maxWidth: .infinity,
                   maxHeight: 250,
                   alignment: .top)
            
            title
            fullInfo
        }
    }
    
    private var title: some View {
        VStack {
            HStack {
                Text(event?.type ?? "type")
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
        List {
            Section {
                date
                address
            }
            Section {
                aboutEvent
            }
            Section {
                shareAddToFavourite
            }
        }
        .listStyle(.plain)
    }
    
    private var aboutEvent: some View {
        VStack {
            Text(event?.description ?? "Can't find any information")
            Text(event?.ageRestriction ?? "")
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
        HStack {
            Image("Calendar")
                .padding(24)
                .background(Color.customPurple.opacity(0.2))
                .clipShape(Circle())
            
            VStack {
                Text(event?.dateRange?.start?.description ?? "Date")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                Text(event?.dateRange?.schedules.description ?? "Schedule")
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
        HStack {
            Image("MapMarker")
                .resizable()
                .frame(width: 20, height: 24)
                .padding(24)
                .background(Color.customPurple.opacity(0.2))
                .clipShape(Circle())
            
            VStack {
                Text(event?.place?.address ?? "Address")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                Text(event?.dateRange?.schedules.description ?? "Schedule")
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                
                //move to map
                Button {
                    
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
    }
    
    private var backButton: some View {
        VStack {
            HStack {
                CustomButton(type: .back)
                    .frame(alignment: .leading)
                    .background(.white.opacity(0.9))
                    .clipShape(Circle())
                
                Spacer()
            }
            .padding()
            .frame(alignment: .topLeading)
            
            Spacer()
        }
    }
}

struct EventFullInfoView_Previews: PreviewProvider {
    static var previews: some View {
        FullEventInfoView(event: .constant(.none),
                          isFavourite: .constant(false))
    }
}
