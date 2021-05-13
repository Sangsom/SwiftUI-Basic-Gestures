//
//  ContentView.swift
//  SwiftUI Basic Gestures
//
//  Created by Rinalds Domanovs on 13/05/2021.
//

import SwiftUI

struct TapGestureView: View {
    @State private var isAnimating = false
    @State private var tapped1x = 0

    var body: some View {
        VStack {
            Text("Tapped 1X: \(tapped1x) times")
                .font(.caption)

            Circle()
                .frame(width: 80, height: 80)
                .foregroundColor(.orange)
                .overlay(
                    Text("1X")
                        .fontWeight(.medium)
                )
                .background(
                    Circle()
                        .strokeBorder(Color.blue, lineWidth: 3)
                        .scaleEffect(isAnimating ? 1.5 : 1)
                        .opacity(isAnimating ? 0 : 1)
                )
                .onTapGesture {
                    tapped1x += 1
                    withAnimation(Animation.easeOut(duration: 0.5)) {
                        self.isAnimating = true
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.isAnimating = false
                    }
            }
        }
    }
}

struct TapGestureView_Previews: PreviewProvider {
    static var previews: some View {
        TapGestureView()
    }
}
