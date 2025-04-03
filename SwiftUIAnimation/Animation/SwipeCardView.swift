//
//  SwipeCardView.swift
//  SwiftUITips
//
//  Created by Reena Prajapati on 27/03/25.
//

import SwiftUI

struct SwipeCardView: View {

    @State var currentIndex: Int = 0
    @State var cards = ["wall1", "wall2", "wall3", "wall4"]

    var body: some View {

        ZStack {

            ForEach(cards.indices, id: \.self) { index in
                CardView(card: cards[index])
                    .offset(x: CGFloat(index - currentIndex) * 350)
                    .scaleEffect(index == currentIndex ? 1 : 0.9)
                    .animation(.spring(), value: currentIndex)
                    .gesture(
                        DragGesture()
                            .onEnded({ gesture in

                                if gesture.translation.width > 100 {
                                    // Righ Swipe
                                    withAnimation {
                                        currentIndex = max(currentIndex - 1, 0)
                                    }
                                } else if gesture.translation.width < -100 {
                                    // Left Swipe
                                    withAnimation {
                                        currentIndex = max(currentIndex + 1, cards.count - 1)
                                    }
                                }

                            })
                    )
                    .shadow(radius: 10)
            }
        }
    }
}

struct CardView: View {

    let card: String
    var body: some View {
        Image(card, bundle: nil)
            .resizable()
            .frame(width: CScreenWidth - 120, height: 400)
            .cornerRadius(10)
    }
}

#Preview {
    SwipeCardView()
}
