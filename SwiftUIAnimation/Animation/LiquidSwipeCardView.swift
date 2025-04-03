//
//  LiquidSwipeCardView.swift
//  SwiftUITips
//
//  Created by Reena Prajapati on 27/03/25.
//

import SwiftUI

struct LiquidSwipeCardView: View {

    @State var isDismissed = false
    @State var offset: CGSize = .zero
    var body: some View {


        VStack {

            VStack {
                Image("wall1", bundle: nil)
                    .resizable()
                    .frame(width: CScreenWidth - 120, height: 400)
                    .cornerRadius(10)
            }
            //                .frame(width: CScreenWidth - 20, height: 400)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged({ gesture in
                        offset.width = gesture.translation.width
                        offset.height = sin(gesture.translation.width / 100) * 20
                    })
                    .onEnded({ value in
                        if abs(offset.width) > 120 {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                                isDismissed = true
                            }
                        } else {
                            withAnimation(.spring()) {
                                offset = .zero
                            }
                        }
                    })
            )
            .shadow(radius: 10)

        }
        .frame(width: CScreenWidth, height: CScreenHeight)
        .background(
            LinearGradient(colors: [.white, .gray], startPoint: .topLeading, endPoint: .bottomTrailing)
        )

    }
}

#Preview {
    LiquidSwipeCardView()
}
