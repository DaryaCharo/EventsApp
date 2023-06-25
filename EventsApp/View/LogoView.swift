//
//  LogoView .swift
//  EventsApp
//
//  Created by Darya Charniankova on 22.06.23.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
            Text("Acara")
                .font(.customFont(type: .extraBold,
                                  size: 50))
                .foregroundColor(.customPurple).opacity(0.9)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
