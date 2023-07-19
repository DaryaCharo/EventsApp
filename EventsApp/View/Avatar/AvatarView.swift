//
//  AvatarView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 18.07.23.
//

import SwiftUI
import PhotosUI

struct AvatarView: View {
    
    var body: some View {
        Image(systemName: "person.fill")
            .resizable()
            .frame(maxWidth: 80, maxHeight: 80)
            .foregroundColor(.customPurple.opacity(0.6))
            .padding()
            .background(Color.white)
            .clipShape(Circle())
            .padding()
            .shadow(radius: 1)
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
