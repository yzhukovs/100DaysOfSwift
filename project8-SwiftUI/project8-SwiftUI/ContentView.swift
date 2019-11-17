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
    @State var isShowing: Bool = false
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, missions: self.missions, astronauts: self.astronauts)) {
                    Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44 )
                    VStack(alignment: .leading) {
                        
                        Text(mission.displayName)
                            .font(.headline)
                        if self.isShowing {
                        Text(mission.formatterLaunchDate)
                            .font(.headline)
                        } else {
                            HStack {
                            ForEach(mission.crew, id:\.name) { i in
                                Text(i.name)
                                .font(.headline)
                                }
                            }
                        }
                    }
                }
                } .navigationBarTitle("Moonshot")
            
                .navigationBarItems(trailing:
                        Toggle(isOn: $isShowing) {
                           Text("Show")
                            
               }
            
    )}
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
