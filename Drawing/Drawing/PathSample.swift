////
////  ContentView.swift
////  Drawing
////
////  Created by wizz on 2/8/22.
////
//
//import SwiftUI
//
//struct Triangle: Shape {
//    func path(in rect: CGRect)-> Path {
//        var path = Path()
//        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
//        //path.closeSubpath()
//        
//        return path
//    }
//}
//
//struct Arc: InsettableShape {
//    let startAngle: Angle
//    let endAngle: Angle
//    let clockwise: Bool
//    var insetAmount = 0.0
//    
//    func path(in rect: CGRect) -> Path {
//        let rotatonAdjustment = Angle.degrees(90)
//        let modifiedStart = startAngle - rotatonAdjustment
//        let modifiedEnd = endAngle - rotatonAdjustment
//        
//        var path = Path()
//        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
//        return path
//    }
//    
//    func inset(by amount: CGFloat) -> some InsettableShape {
//        var arc = self
//        arc.insetAmount += amount
//        return arc
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
////        Triangle()
////            .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
////            .frame(width: 300, height: 300)
//        Arc(startAngle: .degrees(270), endAngle: .degrees(90), clockwise: true)
//            .strokeBorder(.blue, lineWidth: 40)
//
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
