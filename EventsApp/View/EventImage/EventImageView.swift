//
//  EventImageView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 11.07.23.
//

import SwiftUI
import Kingfisher

struct EventImageView: View {
    var imageFor: ViewType?
    @State var imageURL = ""
    
    var body: some View {
        if imageFor == .shortInfo {
            shortViewImage
        } else {
            fullInfoImage
        }
    }
    
    
    private var fullInfoImage: some View {
        ZStack(alignment: .topLeading) {
            KFImage(URL(string: imageURL))
                .placeholder {
                    VStack {
                        Image(systemName: "photo.fill")
                            .resizable()
                            .frame(width: 30,
                                   height: 25)
                            .foregroundColor(.customPurple)
                            .padding(.top, 100)
                        Text("Images have not been added yet")
                            .foregroundColor(.customPurple)
                            .font(.callout)
                            .padding(.bottom, 80)
                    }
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity,
                           alignment: .center)
                    .padding(.horizontal)
                }
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity,
                       maxHeight: 200)
            
            CustomButton(type: .back)
                .padding(3)
                .background(Color.white.opacity(0.9))
                .shadow(radius: 0.1)
                .clipShape(Circle())
                .padding([.leading, .top])
        }
    }
    
    private var shortViewImage: some View {
        VStack {
            KFImage(URL(string: imageURL))
                .placeholder {
                    VStack {
                        Image(systemName: "photo.fill")
                            .resizable()
                            .frame(width: 30,
                                   height: 25)
                            .foregroundColor(.customPurple)
                            .padding(.top)
                        Text("Images have not been added yet")
                            .foregroundColor(.customPurple)
                            .font(.callout)
                            .padding(.bottom)
                    }
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity,
                           alignment: .center)
                    .padding(.horizontal)
                }
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity,
                       maxHeight: 250)
        }
    }
    
    enum ViewType {
        case fullInfo, shortInfo
    }
}

struct EventImageView_Previews: PreviewProvider {
    static var previews: some View {
        EventImageView(imageFor: .shortInfo)
    }
}
