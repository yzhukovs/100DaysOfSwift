//
//  AstronautView.swift
//  project8-SwiftUI
//
//  Created by Yvette Zhukovsky on 11/11/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                    .padding()
                    
                }
            }
            
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
