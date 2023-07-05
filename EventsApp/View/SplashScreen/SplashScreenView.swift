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
    
    @State private var isLoading = false
    @State private var revealStroke = false
    @State private var strokeAnimation = false
    
    var body: some View {
        if isActive {
            StartPage()
        } else {
            loadingView
        }
    }
    
    private var loadingView: some View {
        VStack {
            Spacer()
            VStack {
                Image("Logo")
                Text("Acara")
                    .font(.customFont(type: .extraBold,
                                      size: 70))
                    .foregroundColor(.customPurple).opacity(0.9)
            }
            .scaleEffect(size)
            .opacity(opacity)
            
            Spacer()
            strokeCircle
                .padding(.bottom, 30)
        }
        .onAppear {
            withAnimation(.easeIn(duration: 1.2)) {
                self.size = 0.9
                self.opacity = 1
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                self.isActive.toggle()
            }
        }
    }
    
    private var strokeCircle: some View {
        ZStack {
            Circle()
                .trim(from: revealStroke ? 0 : 1, to: 1)
                .stroke(style: StrokeStyle(lineWidth: 15,
                                           lineCap: .round,
                                           lineJoin: .round,
                                           dash: [1, 30],
                                           dashPhase: 3))
                .frame(maxWidth: 70)
                .rotationEffect(Angle(degrees: 360))
                .foregroundColor(.customPurple)
                
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.linear(duration: 1).delay(0.1).repeatForever(autoreverses: true))  {
                    revealStroke.toggle()
                    isLoading.toggle()
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
