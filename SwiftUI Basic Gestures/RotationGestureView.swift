//
//  RotationGestureView.swift
//  SwiftUI Basic Gestures
//
//  Created by Rinalds Domanovs on 17/05/2021.
//

import SwiftUI

struct RotationGestureView: View {
    @State private var angle = Angle(degrees: 0.0)
    @State private var backgroundAngle = Angle(degrees: 0.0)

    var rotation: some Gesture {
        RotationGesture()
            .onChanged { angle in
                self.angle = angle
            }
            .onEnded { angle in
                withAnimation(Animation.spring()) {
                    self.backgroundAngle = angle
                }
            }
    }

    var body: some View {
        Rectangle()
            .frame(width: 150, height: 150, alignment: .center)
            .foregroundColor(.orange)
            .rotationEffect(self.angle)
            .gesture(rotation)
            .background(
                Rectangle()
                    .shadow(color: .primary, radius: 10, x: 0.0, y: 0.0)
                    .foregroundColor(.secondary)
                    .rotationEffect(backgroundAngle)
            )
    }
}

struct RotationGestureView_Previews: PreviewProvider {
    static var previews: some View {
        RotationGestureView()
    }
}
