//
//  FavoriteButtonView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 11.07.23.
//

import SwiftUI

struct FavouriteButton: View {
    @State var type: ButtonType?
    @State var showView: ShowView?
    @StateObject var vm = FavouriteVM()
    @State var id = 0
    @Binding var isFavourite: Bool
//    @Binding var isFavourite: FavouriteState
    
    var body: some View {
        VStack {
            switch type {
            case .regular:
//                Button {
//                    isFavourite = isFavourite == .notFavourite ? .favourite : .notFavourite
//                } label: {
//                    Image(systemName: isFavourite == .favourite ? "bookmark.fill" : "bookmark")
//                        .foregroundColor(.customPurple)
//                }
                Button {
                    isFavourite.toggle()
                } label: {
                    Image(systemName: isFavourite ? "bookmark.fill" : "bookmark")
                        .foregroundColor(.customPurple)
                }
                .buttonStyle(UserInteractionButtonsStyle())
            case .forFullView:
//                Button {
//                    isFavourite = isFavourite == .notFavourite ? .favourite : .notFavourite
//                } label: {
//                    Image(systemName: isFavourite == .favourite ? "bookmark.fill" : "bookmark")
//                        .resizable()
//                        .frame(width: 15, height: 25)
//                        .foregroundColor(.customPurple)
//                        .padding(21)
//                        .background(Color.customPurple.opacity(0.2))
//                        .clipShape(Circle())
//                }
                Button {
                    isFavourite.toggle()
                } label: {
                    Image(systemName: isFavourite ? "bookmark.fill" : "bookmark")
                        .resizable()
                        .frame(width: 15, height: 25)
                        .foregroundColor(.customPurple)
                        .padding(21)
                        .background(Color.customPurple.opacity(0.2))
                        .clipShape(Circle())
                }
            case .favouriteView:
                Button {
                    showView = .favouriteView
                } label: {
                    Image(systemName: "bookmark.fill")
                        .foregroundColor(.customPurple)
                }
                .buttonStyle(UserInteractionButtonsStyle())
                .fullScreenCover(item: $showView) { _ in
                    FavouriteView(vm: vm)
                }
            case .none:
                Text("")
            }
        }
        .task {
            await makeFavourite()
        }
    }
    
    func makeFavourite() async {
//        isFavourite == .favourite ?
//        await vm.editFavourites(action: .add,
//                                ids: [id]) :
//        await vm.editFavourites(action: .update,
//                                ids: [id])
        isFavourite ?
        await vm.editFavourites(action: .add,
                                ids: [id]) :
        await vm.editFavourites(action: .update,
                                ids: [id])
    }
    
    enum ShowView: Identifiable {
        case favouriteView
        var id: Int {
            return 1
        }
    }
    enum ButtonType {
        case forFullView, regular, favouriteView
    }
}

struct FavoriteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteButton(type: .forFullView,
                        id: 0,
                        isFavourite: .constant(false))
    }
}
