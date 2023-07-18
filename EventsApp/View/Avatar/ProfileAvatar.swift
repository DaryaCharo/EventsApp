//
//  ProfileAvatar.swift
//  EventsApp
//
//  Created by Darya Charniankova on 18.07.23.
//

import SwiftUI

struct ProfileAvatar: View {
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
        }
    }
}

struct ProfileAvatar_Previews: PreviewProvider {
    static var previews: some View {
        ProfileAvatar(data: .empty)
    }
}
