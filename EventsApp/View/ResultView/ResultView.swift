//
//  EmtyResultView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 6.07.23.
//

import SwiftUI

struct ResultView: View {
    @State var type: ViewType?
    
    var body: some View {
        VStack {
            Image(systemName: type?.getImage ?? "")
                .resizable()
                .frame(maxWidth: type == .favourites ||
                                  type == .notification ? 40 : 50,
                       maxHeight: 50)
                .foregroundColor(.white)
                .padding(50)
                .background(Color.customPurple.opacity(0.9))
                .containerShape(Circle())
                .padding()
            
            if type == .search {
                text
                Text("Please try another keyword")
                    .font(.customFont(type: .regular,
                                      size: 18))
            } else {
                text
            }
        }
    }
    private var text: some View {
        Text(type?.getText ?? "")
            .font(.title)
            .bold()
        .foregroundColor(.customPurple).opacity(0.9)
        .frame(maxWidth: .infinity,
               alignment: .center)
        .padding()
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(type: .search)
    }
}

enum ViewType {
    case notification, favourites, image, search, success
    
    var getImage: String {
        switch self {
        case .notification:
            return "bell.fill"
        case .favourites:
            return "bookmark.fill"
        case .image:
            return "photo.fill"
        case .search:
            return "xmark.seal.fill"
        case .success:
            return "checkmark.circle.fill"
        }
    }
    
    var getText: String {
        switch self {
        case .notification:
            return "You have no notifications"
        case .favourites:
            return "You have no bookmarked event"
        case .image:
            return "Images have not been added yet"
        case .search:
            return "No results found"
        case .success:
            return "Changes save successfully"
        }
    }
}
