//
//  AvatarView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 18.07.23.
//

import SwiftUI
import PhotosUI

struct AvatarView: View {
    @State var selectedPhotos: [PhotosPickerItem] = []
    @State var data: Data
    
    var body: some View {
        VStack {
            if data == .empty {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(maxWidth: 80, maxHeight: 80)
                    .foregroundColor(.customPurple.opacity(0.6))
                    .padding()
                    .background(Color.white)
                    .clipShape(Circle())
                    .padding()
                    .shadow(radius: 1)
            } else if let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .clipShape(Circle())
                .scaledToFit()
                .frame(maxWidth: 155, maxHeight: 155)
                .shadow(radius: 1)
            }
            
            PhotosPicker(selection: $selectedPhotos,
                         maxSelectionCount: 1,
                         matching: .images) {
                Text("Change avatar")
                    .foregroundColor(.customPurple.opacity(0.9))
            }
                         .onChange(of: selectedPhotos) { newValue in
                             guard let item = selectedPhotos.first else { return }
                             item.loadTransferable(type: Data.self) { result in
                                 switch result {
                                 case .success(let data):
                                     if let data = data {
                                         self.data = data
                                     }
                                 case .failure(let error):
                                     print(error)
                                 }
                             }
                         }
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(data: .empty)
    }
}
