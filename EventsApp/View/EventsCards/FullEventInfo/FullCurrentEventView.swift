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
                Text(event?.type ?? "событие")
                    .padding(8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(lineWidth: 2)
                    }
                    .foregroundColor(.customPurple)
                
                Spacer()
                
                Text(event?.favouritesCount?.description ?? "0")
                Text("пойдёт")
            }
            
            HStack {
                Text(event?.title ?? "Название")
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
            Text(event?.description ?? "Не удалось найти никакой информации" )
                .frame(maxWidth: .infinity,
                       alignment: .leading)
            HStack(spacing: 5) {
                Text(event?.ageRestriction ?? "0")
                Text(event?.ageRestriction == "0" ?
                     "+" : "")
                   
            }
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity,
                   alignment: .leading)
            
            Text(event?.place?.phone ?? "Телефон не был добавлен")
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
                            id: event?.id ?? 0)
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
                Text(event?.dateRange?.startDate?.formatted(date: .abbreviated,
                                                            time: .omitted) ?? "Дата неизвестна")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                
                //add event to calendar
                Button {
                    
                } label: {
                    Text("Добавить в календарь")
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
                Text(event?.place?.address ?? "Адрес не был добавлен")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                
                Label {
                    Text(event?.place?.subway ?? "Станция метро ещё не добавлена")
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
                    Text("Посмотреть на карте")
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
            MapView(lat: event?.place?.coords?.lat ??
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
        FullCurrentEventView(event: .none)
    }
}
