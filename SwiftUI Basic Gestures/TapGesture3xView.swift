//
//  TapGesture3xView.swift
//  SwiftUI Basic Gestures
//
//  Created by Rinalds Domanovs on 13/05/2021.
//

import SwiftUI

struct TapGesture3xView: View {
    @State private var isAnimating = false
    @State private var tapped3x = 0 

    var multipleTap: some Gesture {
        TapGesture(count: 3)
            .onEnded { _ in
                tapped3x += 1

                withAnimation(Animation.easeOut(duration: 0.5)) {
                    self.isAnimating = true
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.isAnimating = false
                }
            }
    }

    var body: some View {
        VStack {
            Text("Tapped 3X: \(tapped3x) times")
                .font(.caption)

            Circle()
                .frame(width: 80, height: 80)
                .foregroundColor(.orange)
                .overlay(
                    Text("3X")
                        .fontWeight(.medium)
                )
                .background(
                    Circle()
                        .strokeBorder(Color.blue, lineWidth: 3)
                        .scaleEffect(isAnimating ? 1.5 : 1)
                        .opacity(isAnimating ? 0 : 1)
                )
                .gesture(multipleTap)
        }
    }
}

struct TapGesture3xView_Previews: PreviewProvider {
    static var previews: some View {
        TapGesture3xView()
    }
}
