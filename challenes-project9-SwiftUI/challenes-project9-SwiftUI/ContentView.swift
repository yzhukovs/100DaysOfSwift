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
    var body: some View {
        VStack {
        Triangle()
            .fill(Color.blue)
            .frame(width: 300, height: 300)
        
        Rectangle()
            .fill(Color.blue)
            .frame(width: 100, height: 400)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
