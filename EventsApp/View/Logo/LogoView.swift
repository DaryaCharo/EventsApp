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
                .frame(maxWidth: 90, maxHeight: 90)
            Text("Acara")
                .font(.customFont(type: .extraBold,
                                  size: 40))
                .foregroundColor(.customPurple).opacity(0.9)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
