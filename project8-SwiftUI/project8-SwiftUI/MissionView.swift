//
//  MissionView.swift
//  project8-SwiftUI
//
//  Created by Yvette Zhukovsky on 11/11/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
        let missions: Mission
    }
    let mission: Mission
    let missions: [Mission]
    let astronauts: [CrewMember]
    var body: some View {
        GeometryReader { geometry in
            ScrollView( .vertical) {
                VStack {
                    Image(self.mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: geometry.size.width * 0.7)
                    .padding(.top)
                    Text(self.mission.formatterLaunchDate)
                    .padding()
                    Text(self.mission.description)
                    .padding()
                    ForEach(self.astronauts, id: \.role) { crewMember in
                        NavigationLink(destination: AstronautView(missions: self.missions, astronaut: crewMember.astronaut)) {
                            HStack {
                                Image(crewMember.astronaut.id)
                                .resizable()
                                    .frame(width: 83, height: 60)
                                    .clipShape(Capsule())
                                .overlay(Capsule()
                                    .stroke(Color.primary, lineWidth: 1))
                                VStack(alignment: .leading) {
                                    Text(crewMember.astronaut.name)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                    }
                    .buttonStyle(PlainButtonStyle())
                    }
                    
                    Spacer(minLength: 25)
                }
            }
            
        }
        .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
    }
    
    init(mission: Mission, missions: [Mission], astronauts: [Astronaut]) {
        self.mission = mission
        self.missions = missions
        
        var matches = [CrewMember]()
        for members in mission.crew {
            if let match = astronauts.first(where: {$0.id == members.name}) {
                matches.append(CrewMember(role: members.role, astronaut: match, missions: mission)) }
            else {
                fatalError("Missing \(members)")
            }
        }
        self.astronauts = matches
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0], missions: missions, astronauts: astronauts)
    }
}
