//
//  ContentView.swift
//  actual-project9-SwiftUI
//
//  Created by Yvette Zhukovsky on 11/21/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import SwiftUI

struct Spirograph: Shape {
    let innerRadius: Int
    let outerRadius: Int
    let distance: Int
    let amount: CGFloat
    
    
    func gcd(_ a: Int, _ b: Int)-> Int {
        var a = a
        var b = b
         
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        return a
    }
    
    func path(in rect: CGRect) -> Path {
        let path = Path()
        
        
        
        
        
        return path
    }
    
    
}

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
