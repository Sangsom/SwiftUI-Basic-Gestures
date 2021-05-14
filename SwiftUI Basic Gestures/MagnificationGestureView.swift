//
//  MagnificationGestureView.swift
//  SwiftUI Basic Gestures
//
//  Created by Rinalds Domanovs on 14/05/2021.
//

import SwiftUI

struct MagnificationGestureView: View {
    @State var magnifiedValue: CGFloat = 1.0

    var magnification: some Gesture {
        MagnificationGesture()
            .onChanged { value in
                magnifiedValue = value
            }
            .onEnded { value in
                magnifiedValue = 1.0
            }
    }

    var body: some View {
        Circle()
            .frame(width: 100 * magnifiedValue, height: 100 * magnifiedValue)
            .foregroundColor(.orange)
            .gesture(magnification)
            .animation(.easeOut)
    }
}

struct MagnificationGestureView_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureView()
    }
}
