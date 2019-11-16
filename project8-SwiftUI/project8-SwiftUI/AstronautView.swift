//
//  AstronautView.swift
//  project8-SwiftUI
//
//  Created by Yvette Zhukovsky on 11/11/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    struct MissionCrew {
        let displayName: Mission
    }
    
    let austrauntsInfo = [MissionView.CrewMember]()
    let missions: [Mission]
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
                    .padding()
                    .layoutPriority(1)
                    ForEach(self.astronaut.wasInMissions(missions: self.missions)) { i in
                        Text(i.displayName)
                        
                    }
                  

                }
            
            }
                
            
        
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
  static let mission: [Mission] = Bundle.main.decode("missions.json")
    //static let austrauntsInfo: [MissionView.CrewMember]
    static var previews: some View {
        AstronautView(missions: mission, astronaut: astronauts[0])
    }
}
