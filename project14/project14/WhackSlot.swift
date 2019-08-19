//
//  WhackSlot.swift
//  project14
//
//  Created by Yvette Zhukovsky on 8/19/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//
import SpriteKit
import UIKit

class WhackSlot: SKNode {
    func configure(at position: CGPoint){
        self.position = position
        
        let sprite = SKSpriteNode(imageNamed: "whackHole")
        addChild(sprite)
    }
    

}
