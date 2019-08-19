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
    var charNode: SKSpriteNode!
    func configure(at position: CGPoint){
        self.position = position
        
        let sprite = SKSpriteNode(imageNamed: "whackHole")
        addChild(sprite)
        
        
        let cropNode = SKCropNode()
        cropNode.position = CGPoint(x: 0, y: 15)
        cropNode.zPosition = 1
        cropNode.maskNode = SKSpriteNode(imageNamed: "whackMask")
        
        charNode = SKSpriteNode(imageNamed: "penguinGood")
        charNode.position = CGPoint(x: 0, y: -90)
        charNode.name = "character"
        cropNode.addChild(charNode)
        addChild(cropNode)
    }
    

}
