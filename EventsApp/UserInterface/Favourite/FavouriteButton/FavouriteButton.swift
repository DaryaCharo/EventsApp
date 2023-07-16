//
//  FavoriteButtonView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 11.07.23.
//

import SwiftUI

struct FavouriteButton: View {
    @StateObject var vm = FavouriteVM()
    @State var type: ButtonType?
    @State var id = 0
    
    var body: some View {
        VStack {
            switch type {
            case .regular:
                Button {
                    vm.isFavourite.toggle()
                    Task {
                        await makeFavourite()
                    }
                } label: {
                    Image(systemName: fillButton())
                        .foregroundColor(.customPurple)
                }
                .buttonStyle(UserInteractionButtonsStyle())
            case .forFullView:
                Button {
                    vm.isFavourite.toggle()
                    Task {
                        await makeFavourite()
                    }
                } label: {
                    Image(systemName: fillButton())
                        .resizable()
                        .frame(width: 15, height: 25)
                        .foregroundColor(.customPurple)
                        .padding(21)
                        .background(Color.customPurple.opacity(0.2))
                        .clipShape(Circle())
                }
            case .favouriteView:
                Button {
                    vm.showView = .favouriteView
                } label: {
                    Image(systemName: "bookmark.fill")
                        .foregroundColor(.customPurple)
                }
                .buttonStyle(UserInteractionButtonsStyle())
                .fullScreenCover(item: $vm.showView) { _ in
                    FavouriteView(vm: vm)
                }
            case .none:
                Text("")
            }
        }
        .task {
            await vm.editFavourites(action: .check,
                                    id: id)
        }
    }
    
    func makeFavourite() async {
        vm.isFavourite ?
        await vm.editFavourites(action: .add,
                                id: id) :
        await vm.editFavourites(action: .update,
                                id: id)
    }
    
    func fillButton() -> String {
        !vm.favourites.contains(id) && vm.isFavourite ? "bookmark.fill" : "bookmark"
    }
    
    enum ButtonType {
        case forFullView, regular, favouriteView
    }
}

struct FavoriteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteButton(type: .forFullView,
                        id: 0)
    }
}
