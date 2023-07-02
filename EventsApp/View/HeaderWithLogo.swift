//
//  Header.swift
//  EventsApp
//
//  Created by Darya Charniankova on 21.06.23.
//

import SwiftUI

struct HeaderWithLogo: View {
    @State var title: String
    
    var body: some View {
        HStack {
            Label {
                Text(title)
                    .font(.customFont(type: .semiBold,
                                      size: 24))
                    .padding(.leading, 5)
            } icon: {
                Image("Logo")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .padding(.leading, 10)
            }
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        HeaderWithLogo(title: "")
    }
}
