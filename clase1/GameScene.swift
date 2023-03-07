//
//  GameScene.swift
//  clase1
//
//  Created by iOS Maquina 10 on 13/02/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var circulo: SKShapeNode?
    var timer = Timer()
    var copo: [CGFloat] = [-300, 300, 300, 300, -300, -300, 300, -300]
    let random = GKRandomDistribution(lowestValue: 0, highestValue: 3)
    var x = CGFloat()
    var y = CGFloat()
    var auxiliar = [Int]()
    
    override func sceneDidLoad()
    {
        backgroundColor = .black
        circulo = SKShapeNode(circleOfRadius: 1)
        circulo?.fillColor = .white
        circulo?.strokeColor = .white
        circulo?.lineWidth = 1
        
        //circulo?.run(SKAction.sequence([SKAction.fadeOut(withDuration: 5),SKAction.wait(forDuration: 1),SKAction.removeFromParent()]))
    }
    
    @objc func fractal()
    {
        let circulocopy = circulo?.copy() as! SKShapeNode
        let aux = random.nextInt()
        auxiliar.append(aux)
        if auxiliar.endIndex != 1
        {
            if 1 != auxiliar.last
            {
                x = x + (copo[aux*2]-x)/2
                y = y + (copo[aux*2+1]-y)/2
                circulocopy.position = CGPoint(x: x, y: y)
                addChild(circulocopy)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(fractal), userInfo: nil, repeats: true)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
