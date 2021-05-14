//
//  DragGestureView.swift
//  SwiftUI Basic Gestures
//
//  Created by Rinalds Domanovs on 14/05/2021.
//

import SwiftUI

struct DragGestureView: View {
    @State private var location: CGPoint = CGPoint(x: 100, y: 100)

    var drag: some Gesture {
        DragGesture(minimumDistance: 1, coordinateSpace: .local)
            .onChanged { value in
                location = value.location
            }
            .onEnded { value in
                withAnimation(.easeOut) {
                    location = CGPoint(x: 100, y: 100)
                }
            }
    }

    var body: some View {
        Circle()
            .frame(width: 100, height: 100)
            .foregroundColor(.orange)
            .position(location)
            .gesture(drag)
    }
}

struct DragGestureView_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureView()
    }
}
