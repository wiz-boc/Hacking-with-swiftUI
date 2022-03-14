//
//  CardView.swift
//  Flashzilla
//
//  Created by wizz on 3/6/22.
//

import SwiftUI

struct CardView: View {
    
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    @State private var feedback = UINotificationFeedbackGenerator()
    
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    
    
    let card: Card
    var removal: (() -> Void)? = nil
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                    differentiateWithoutColor ?
                    .white : .white.opacity(1 - Double(abs(offset.width / 150)))
                )
                .background(
                    differentiateWithoutColor ? nil :
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(offset.width > 0 ? .green : .red)
                )
                .shadow(radius: 10)
            
            VStack{
                if voiceOverEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }else{
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    
                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250, alignment: .center)
        .rotationEffect(.degrees(Double(offset.width / 10)))
        .offset(x: offset.width, y: 0)
        .opacity(2 - Double(abs(offset.width / 150)))
        .accessibilityAddTraits(.isButton)
        .gesture(
            DragGesture()
                .onChanged({ gesture in
                    offset = gesture.translation
                    
                    feedback.prepare()
                })
                .onEnded({ _ in
                    if abs(offset.width) > 300 {
                        if offset.width < 0 {
                            feedback.notificationOccurred(.error)
                        }
                        removal?()
                    } else {
                        offset = .zero
                    }
                })
        )
        .onTapGesture {
            isShowingAnswer.toggle()
        }
        .animation(.spring(), value: offset)
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
