//
//  EventView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 15.06.23.
//

import SwiftUI
import Kingfisher

struct CurrentEventView: View {
    @State var showView: ShowView?
    @State var event: CurrentEvent?
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 8) {
                EventImageView(imageFor: .shortInfo,
                               imageURL: event?.images?.image ?? "")

                eventInfo
            }
            infoAndFavBtns
                .padding([.bottom, .trailing])
        }
        .background(Color.customWindowBack)
        .cornerRadius(20)
        .shadow(radius: 1)
        .frame(maxWidth: 300)
        .padding([.horizontal, .bottom])
        .fullScreenCover(item: $showView) { _ in
            FullCurrentEventView(event: event)
        }
    }
    
    private var eventInfo: some View {
        VStack {
            Text(event?.title ?? "Название")
                .font(.customFont(type: .semiBold,
                                  size: 18))
                .lineLimit(3)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
                .padding(.horizontal)
            
            HStack {
                Text(event?.type ?? "событие")
                    .font(.customFont(type: .regular,
                                      size: 16))
                    .padding(8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 2)
                    }
                    .foregroundColor(.customPurple).opacity(0.8)
                
                Text(event?.favouritesCount?.description ?? "0")
                    .font(.customFont(type: .regular,
                                      size: 16))
                    .padding(.leading, 8)
                Text("пойдут")
                    .font(.customFont(type: .regular,
                                      size: 16))
            }
            .frame(maxWidth: .infinity,
                   alignment: .leading)
            .padding(.horizontal)
            
            HStack {
                Label {
                    Text(event?.place?.address ?? "Адрес не был добавлен")
                        .font(.customFont(type: .regular,
                                          size: 16))
                        .lineLimit(2)
                } icon: {
                    Image("MapMarker")
                        .resizable()
                        .frame(width: 14,
                               height: 18)
                }
                Spacer()
            }
            .padding([.horizontal, .bottom])
            .padding(.trailing, 30)
        }
    }
    
    private var infoAndFavBtns: some View {
        VStack {
            Button {
                showView = .fullView
            } label: {
                Image(systemName: "info.circle")
                    .padding(5)
            }
            .buttonStyle(UserInteractionButtonsStyle())
            
            FavouriteButton(type: .regular,
                            id: event?.id ?? 0)
        }
    }
    
    enum ShowView: Identifiable {
        case fullView
        
        var id: Int {
            return 1
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentEventView()
    }
}

