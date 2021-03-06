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
    var isVisible = false
    var isHit = false
    
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
    
    func show(hideTime: Double) {
        if isVisible {return}
        charNode.yScale = 1
        charNode.xScale = 1
        charNode.run(SKAction.moveBy(x: 0, y: 80, duration: 0.05))
        if let particles = SKEmitterNode(fileNamed: "MudParticle.sks") {
        particles.position = charNode.position
        particles.numParticlesToEmit = 15
        addChild(particles)
        }
        isVisible = true
        isHit = false
        
        if Int.random(in: 0...2) == 0 {
            charNode.texture = SKTexture(imageNamed: "penguinGood")
            charNode.name = "charFriend"
        } else {
            charNode.texture = SKTexture(imageNamed: "penguinEvil")
            charNode.name = "charEnemy"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + (hideTime * 3.5))  {[weak self] in
        self?.hide()
        }
    }

    func hide() {
        
        if !isVisible {return}
        charNode.run(SKAction.moveBy(x: 0, y: -80, duration: 0.05))
        if let particles = SKEmitterNode(fileNamed: "MudParticle.sks") {
        particles.position = charNode.position
        particles.numParticlesToEmit = 15
        addChild(particles)
        }
        isVisible = false
    }
    
    func hit() {
        isHit = true
        if let particles = SKEmitterNode(fileNamed: "SmokeEffectParticle.sks") {
            particles.position = charNode.position
            particles.numParticlesToEmit = 15
            addChild(particles)
        }
        let delay = SKAction.wait(forDuration: 0.25)
        let hide = SKAction.moveBy(x: 0, y: -80, duration: 0.5)
        let notVisible = SKAction.run {[weak self] in
            self?.isVisible = false
        }
        let sequence = SKAction.sequence([delay, hide, notVisible])
        charNode.run(sequence)
        
        
    }
    
}
