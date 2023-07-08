//
//  EventView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 15.06.23.
//

import SwiftUI
import Kingfisher

struct EventView: View {
    @StateObject var vm = HomeVM()
    @StateObject var favVM = FavouriteVM()
    @State var currentEvent: CurrentEvent?
    @State var eventFromList: ListEvent?
    var type: EventType?
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                if let imageName = type == .current ?
                        currentEvent?.images?.image :
                        eventFromList?.images?.image {
                    KFImage(URL(string: imageName))
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity,
                               maxHeight: .infinity,
                               alignment: .top)
                        .background(.gray)
                } else {
                    VStack {
                        Spacer()
                        Image(systemName: "photo.fill")
                            .resizable()
                            .frame(width: 30,
                                   height: 25)
                            .foregroundColor(.customPurple)
                        Text("Images have not been added yet")
                            .foregroundColor(.customPurple)
                            .font(.callout)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity,
                           alignment: .center)
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                }
            }
            VStack {
                eventInfo
            }
            VStack {
                learnMoreBtn
                CustomButton(type: .favourite)
            }
                .padding([.bottom, .trailing])
        }
        .background(Color.customWindowBack)
        .cornerRadius(20)
        .shadow(radius: 1)
        .frame(maxWidth: 300,
               maxHeight: 350)
        .padding()
        .fullScreenCover(item: $vm.showView) { _ in
            type == .current ?
            FullEventInfoView(currentEvent: currentEvent,
                              type: type) :
            FullEventInfoView(eventFromList: eventFromList,
                              type: type)
        }
    }
    
    private var eventInfo: some View {
        VStack {
            Spacer()
            
            Text(type == .current ?
                    currentEvent?.title ?? "Title" :
                    eventFromList?.title ?? "")
                .font(.customFont(type: .semiBold,
                                  size: 18))
                .lineLimit(3)
                .frame(maxWidth: .infinity,
                       maxHeight: 50,
                       alignment: .leading)
                .padding(.horizontal)
            
            HStack {
                Text(type == .current ?
                        currentEvent?.type ?? "event" :
                        eventFromList?.categories?.first?.name ?? "event")
                    .font(.customFont(type: .regular,
                                      size: 16))
                    .padding(8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 2)
                    }
                    .foregroundColor(.customPurple).opacity(0.8)
                
                Text(type == .current ?
                        currentEvent?.favouritesCount?.description ?? "0" :
                        eventFromList?.favouritesCount?.description ?? "0")
                    .font(.customFont(type: .regular,
                                      size: 16))
                    .padding(.leading, 8)
                Text(" Going")
                    .font(.customFont(type: .regular,
                                      size: 16))
            }
            .frame(maxWidth: .infinity,
                   alignment: .leading)
            .padding(.horizontal)
            
            HStack {
                Label {
                    Text(type == .current ?
                            currentEvent?.place?.address ?? "Place doesn't have address yet" :
                            eventFromList?.place?.address ?? "Place doesn't have address yet")
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
        .background(Color.customWindowBack)
        .padding(.top, 200)
    }
    
    private var learnMoreBtn: some View {
        Button {
            vm.showView = .fullInfoView
        } label: {
            Image(systemName: "info.circle")
                .padding(5)
        }
        .buttonStyle(UserInteractionButtonsStyle())
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(currentEvent: .none,
                  type: .current)
    }
}

enum EventType {
    case current, fromList
}
