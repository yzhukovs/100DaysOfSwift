//
//  ContentView.swift
//  challenes-project9-SwiftUI
//
//  Created by Yvette Zhukovsky on 11/22/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                .inset(by: CGFloat(value))
                .strokeBorder(LinearGradient(gradient: Gradient(colors:[
                    self.color(for: value, brightness: 1),
                    self.color(for: value, brightness: 0.5)
                ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)

            }
        }
    .drawingGroup()
    }
    func color(for value:Int, brightness: Double ) -> Color {
            var targetHue = Double(value) / Double(self.steps) + self.amount
    
            if targetHue > 1 {
                targetHue -= 1
            }
    
            return Color(hue: targetHue, saturation: 1, brightness: brightness)
    
        }
    
    }


struct Triangle: Shape {
    func path(in rect: CGRect)-> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX , y: rect.minY ))
        path.addLine(to: CGPoint(x: rect.minX , y: rect.maxY + 50))
        path.addLine(to: CGPoint(x: rect.maxX , y: rect.maxY + 50 ))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY  ))
        return path

    }
}


struct ContentView: View {
    @State private var lineWidth: CGFloat = 10
    @State private var colorCycle = 0.0
    var body: some View {
        VStack {
        Triangle()
            .stroke(Color.blue, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
        .frame(width: 300, height: 250)
            .onTapGesture {
                withAnimation {
                    self.lineWidth = CGFloat.random(in: 1...20)
        }
        }
        
        
            //.animation(.basic(duration: 2, curve: .linear))
            //.fill(Color.blue)
            
           
        
        Rectangle()
            
                
                 .strokeBorder(Color.blue, lineWidth:lineWidth)
            .animation(.easeInOut)
        
       
           // .fill(Color.blue)
            .frame(width: 100, height: 350)
            .onTapGesture {
                    withAnimation {
                        self.lineWidth = CGFloat.random(in: 1...20)
            }
            }
            
            ColorCyclingRectangle(amount: self.colorCycle)
                            .frame(width: 100, height: 100)
                       Slider(value: $colorCycle)
            
        }
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
