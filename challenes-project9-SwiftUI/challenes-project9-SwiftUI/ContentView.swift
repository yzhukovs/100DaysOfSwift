//
//  ContentView.swift
//  challenes-project9-SwiftUI
//
//  Created by Yvette Zhukovsky on 11/22/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import SwiftUI

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
            
            
        }
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
