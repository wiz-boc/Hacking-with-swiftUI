//
//  ContentView.swift
//  Animations
//
//  Created by wizz on 2/3/22.
//

import SwiftUI


struct CornerRoatateModifier: ViewModifier {
    
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRoatateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRoatateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    
    //@State private var animationAmount = 0.0
    //    let letters = Array("Hello, SwiftUI")
    //    @State private var enabled = false
    //    @State private var dragAmount = CGSize.zero
    @State private var isShowingRed = false
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                //.transition(.scale)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
        
        
        //        VStack{
        //            Button("Tap Me"){
        //                withAnimation {
        //                    isShowingRed.toggle()
        //                }
        //            }
        //            if isShowingRed {
        //                Rectangle()
        //                    .fill(.red)
        //                    .frame(width: 200, height: 200)
        //                    //.transition(.scale)
        //                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
        //            }
        //        }
        
        
        //        HStack( spacing: 0) {
        //            ForEach(0..<letters.count){ num in
        //                Text(String(letters[num]))
        //                    .padding(5)
        //                    .font(.title)
        //                    .background(enabled ? .blue : .red)
        //                    .offset(dragAmount)
        //                    .animation(
        //                        .default.delay(Double(num) / 20)
        //                               ,value: dragAmount)
        //            }
        //            .gesture(
        //                DragGesture()
        //                    .onChanged{
        //                        dragAmount = $0.translation
        //                    }
        //                    .onEnded{ _ in
        //                        dragAmount = .zero
        //                        enabled.toggle()
        //                    }
        //            )
        //        }
        //        LinearGradient(gradient: Gradient(colors: [.yellow,.red]), startPoint: .topLeading, endPoint: .bottomTrailing)
        //            .frame(width: 300, height: 200)
        //            .clipShape(RoundedRectangle(cornerRadius: 10))
        //            .offset(dragAmount)
        //            .gesture(
        //            DragGesture()
        //                .onChanged({
        //                    dragAmount = $0.translation
        //                })
        //                .onEnded({ _ in
        //                    withAnimation {
        //                        dragAmount = .zero
        //                    }
        //                })
        //            )
        //.animation(.spring(), value: dragAmount)
        
        //                Button("Tap Me"){
        //                    //do nth
        //                    enable.toggle()
        //                }
        //                .frame(width: 200, height: 200)
        //                .background(enable ? .blue : .red)
        //                .animation(.default, value: enable)
        //                .foregroundColor(.white)
        //                .clipShape(RoundedRectangle(cornerRadius: enable ? 60 : 0))
        //                .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enable)
        
        //        Button("Tap Me"){
        //            withAnimation {
        //                animationAmount += 70
        //            }
        //
        //        }
        //        .padding(50)
        //        .background(.red)
        //        .foregroundColor(.white)
        //        .clipShape(Circle())
        //        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        //.scaleEffect(animationAmount)
        
        //        VStack{
        //            Stepper("Scale amount", value: $animationAmount.animation(
        //                .easeInOut(duration: 1).repeatCount(3, autoreverses: true)
        //            ), in: 1...10)
        //            Spacer()
        //            Button("Tap Me"){
        //                animationAmount += 1
        //            }
        //            .padding(50)
        //            .background(.red)
        //            .foregroundColor(.white)
        //            .clipShape(Circle())
        //            .scaleEffect(animationAmount)
        //        }
        
        
        
        //        Button("Tap me"){
        //            //do nth
        //            //animationAmount += 1
        //        }
        //        .padding(50)
        //        .background(.red)
        //        .foregroundColor(.white)
        //        .clipShape(Circle())
        //        .overlay(
        //            Circle()
        //                .stroke(.red)
        //                .scaleEffect(animationAmount)
        //                .opacity(2 - animationAmount)
        //                .animation(.easeInOut(duration: 0.9).repeatForever(autoreverses: false), value: animationAmount)
        //        )
        //        .onAppear {
        //            animationAmount = 2
        //        }
        //.scaleEffect(animationAmount)
        //.blur(radius: (animationAmount - 1) * 3)
        //.animation(.easeOut, value: animationAmount)
        //.animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
        //.animation(.easeInOut(duration: 2), value: animationAmount)
        //.animation(.easeInOut(duration: 2)
        // .delay(1), value: animationAmount)
        //.animation(.easeInOut(duration: 2).delay(1), value: animationAmount)
        //.animation(.easeInOut(duration: 1).repeatCount(3, autoreverses: true), value: animationAmount)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
