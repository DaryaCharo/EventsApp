//
//  SplashScreenView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 14.06.23.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            StartPage()
        } else {
            loadingView
        }
    }
    
    private var loadingView: some View {
        VStack {
            VStack {
                Image("Logo")
                Text("Acara")
                    .font(.customFont(type: .extraBold,
                                      size: 70))
                    .foregroundColor(.customColor(type: .base).opacity(0.9))
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1.2)) {
                    self.size = 0.9
                    self.opacity = 1.0
                }
            }
        }
        .onAppear { 
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.isActive.toggle()
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
