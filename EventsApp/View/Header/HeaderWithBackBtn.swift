//
//  HeaderWithBackBtn.swift
//  EventsApp
//
//  Created by Darya Charniankova on 28.06.23.
//

import SwiftUI

struct HeaderWithBackBtn: View {
    @State var title: String
    
    var body: some View {
        HStack {
            CustomButton(type: .back)
            
            Text(title)
                .font(.customFont(type: .semiBold,
                                  size: 24))
            Spacer()
        }
        .padding()
    }
}

struct HeaderWithBackBtn_Previews: PreviewProvider {
    static var previews: some View {
        HeaderWithBackBtn(title: "header")
    }
}
