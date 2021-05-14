//
//  LongPressGestureView.swift
//  SwiftUI Basic Gestures
//
//  Created by Rinalds Domanovs on 14/05/2021.
//

import SwiftUI

struct LongPressGestureView: View {
    @GestureState private var isLongPressDetected = false
    @State private var isDone = false

    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 2)
            .updating($isLongPressDetected) { currentState, gestureState, transaction in
                DispatchQueue.main.async {
                    isDone = false
                }
                gestureState = currentState
                transaction.animation = Animation.easeIn(duration: 2)
            }
            .onEnded { done in
                isDone = done
            }
    }

    var body: some View {
        VStack {
            Spacer()

            Circle()
                .frame(width: 10, height: 10)
                .foregroundColor(isLongPressDetected ? .orange : .primary)
                .scaleEffect(CGSize(
                                width: isLongPressDetected ? 10 : 1,
                                height: isLongPressDetected ? 10 : 1))

            Spacer()
            if isLongPressDetected {
                Text("Updating...")
            }

            if isDone {
                Text("Done")
            }

            Spacer()

            Text("Long Press 2 sec")
                .padding()
                .background(isLongPressDetected ? Color.green : Color.orange)
                .cornerRadius(16)
                .gesture(longPress)
        }
    }
}

struct LongPressGestureView_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureView()
    }
}
