//
//  LiquidButtonAnimationView.swift
//  SwiftUIAnimation
//
//  Created by Reena Prajapati on 28/03/25.
//

import SwiftUI

struct LiquidButtonAnimationView: View {

    @State var isPressed: Bool

    var body: some View {

        ZStack {
            Circle()
                .fill(.red.opacity(0.3))
                .frame(width: isPressed ? 200 : 150, height: isPressed ? 200 : 150)
                .scaleEffect(isPressed ? 1.5 : 1)
                .opacity(isPressed ? 0.2 : 0)
                .animation(.easeOut(duration: 0.2), value: isPressed)

            Image("heart", bundle: nil)
                .resizable()
                .frame(width: isPressed ? 170 : 150, height: isPressed ? 150 : 130)
                .scaleEffect(isPressed ? 1.2 : 1)
                .animation(.spring(response: 0.4, dampingFraction: 0.5), value: isPressed)
                .onTapGesture {
                    withAnimation {
                        isPressed.toggle()
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation {
                            isPressed.toggle()
                        }
                    }
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black.opacity(0.1))
        .ignoresSafeArea()
    }
}

#Preview {
    LiquidButtonAnimationView(isPressed: false)
}
