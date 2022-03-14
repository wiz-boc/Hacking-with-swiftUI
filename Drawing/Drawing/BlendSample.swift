////
////  ContentView.swift
////  Drawing
////
////  Created by wizz on 2/8/22.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    
//    @State private var amount = 0.0
//    
//    var body: some View {
//     
//        VStack{
//            Image("pic")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 200, height: 200)
//                .saturation(amount)
//                .blur(radius: (1 - amount) * 20)
//                
//            Slider(value: $amount)
//                .padding()
//        }
////        VStack{
////            ZStack{
////                Circle()
////                    .fill(.red)
////                    .frame(width: 200 * amount)
////                    .offset(x: -50, y: -80)
////                    .blendMode(.screen)
////
////                Circle()
////                    .fill(.green)
////                    .frame(width: 200 * amount)
////                    .offset(x: 50, y: -80)
////                    .blendMode(.screen)
////
////                Circle()
////                    .fill(.blue)
////                    .frame(width: 200 * amount)
////                    .blendMode(.screen)
////            }
////            .frame(width: 300, height: 300)
////
////            Slider(value: $amount)
////        }
////        .frame(maxWidth: .infinity, maxHeight: .infinity)
////        .background(.black)
////        .ignoresSafeArea()
//      //  ZStack {
////            Image("Circle_pic_p")
////                .colorMultiply(.red)
////            Image("Circle_pic_p")
////
////            Rectangle()
////                .fill(.red)
////                .blendMode(.multiply)
//        //}
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
