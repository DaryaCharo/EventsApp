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
                Text("Результатов по данному запросу не найдено")
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
            .multilineTextAlignment(.center)
            .bold()
            .foregroundColor(.customPurple).opacity(0.9)
            .padding()
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(type: .favourites)
    }
}

enum ViewType {
    case notification, favourites, search
    
    var getImage: String {
        switch self {
        case .notification:
            return "bell.fill"
        case .favourites:
            return "bookmark.fill"
        case .search:
            return "xmark.seal.fill"
        }
    }
    
    var getText: String {
        switch self {
        case .notification:
            return "Список уведомлений пуст"
        case .favourites:
            return "Список избранных пуст"
        case .search:
            return "Результат не найден"
        }
    }
}
