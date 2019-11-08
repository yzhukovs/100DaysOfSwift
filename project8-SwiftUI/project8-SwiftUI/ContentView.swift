//
//  ContentView.swift
//  project8-SwiftUI
//
//  Created by Yvette Zhukovsky on 11/6/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: Text("DetailView")) {
                    Image(mission.image)
                
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
