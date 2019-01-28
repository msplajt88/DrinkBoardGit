//
//  GameScene.swift
//  DrinkBoard
//
//  Created by Marko Splajt on 01/11/2018.
//  Copyright © 2018 MarkoSplajt. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let gameArea: CGRect
    
    // Array which contains all drinks which will be added in createDrinks()
    var drinksArray : Array<Drink> = Array()
    
    override func didMove(to view: SKView) {
        createDrinks()
    
        // Instantiate (create) every drink in the array on screen
        for item in drinksArray {
            createDrink(drink : item)
        }
    }
    
    override init(size: CGSize) {
        gameArea = CGRect (x: 0, y: 0, width: size.width, height: size.height)
        
        super.init(size: size)
    }
    
    // Create drinks and add them to the drinksArray
    func createDrinks() {
        drinksArray.append(Drink(_imageName: "Tequila glass", _drinkName: "Tequila", _scale: 0.06, _fadeIn: 10,
                                 _fadeOut: 10))
        
        drinksArray.append(Drink(_imageName: "Rum glass", _drinkName: "Rum", _scale: 0.06, _fadeIn: 10, _fadeOut : 10))
        
        drinksArray.append(Drink(_imageName: "Dark Beer glass", _drinkName: "Beer", _scale: 0.06, _fadeIn: 10,
                                 _fadeOut: 10))
        
        drinksArray.append(Drink(_imageName: "Daiquiri glass", _drinkName: "Daiquiri", _scale: 0.06, _fadeIn: 10,
                            _fadeOut : 10))
        
        drinksArray.append(Drink(_imageName: "Cuba Libre glass", _drinkName: "CubaLibre", _scale: 0.06, _fadeIn: 10,
                            _fadeOut : 10))
        
        drinksArray.append(Drink(_imageName: "Bloody Mary glass", _drinkName: "BloodyMary", _scale: 0.06, _fadeIn: 10,
                            _fadeOut : 10))
        
        drinksArray.append(Drink(_imageName: "Pina Colada glass", _drinkName: "PinaColada", _scale: 0.06, _fadeIn: 10,
                            _fadeOut: 10))
        
        drinksArray.append(Drink(_imageName: "Cosmopolitan cocktail glass", _drinkName: "Cosmopolitan", _scale: 0.06, _fadeIn: 10, _fadeOut : 10))
        
        drinksArray.append(Drink(_imageName: "Mojito glass", _drinkName: "Mojito", _scale: 0.06, _fadeIn: 10, _fadeOut: 10))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createDrink(drink : Drink) {
        let randomXStart = random(min: gameArea.minX, max: gameArea.maxX)
        let randomXEnd = random(min: gameArea.minX, max: gameArea.maxX)
        
        let randomYStart = random(min: gameArea.minY, max: gameArea.maxY)
        let randomYEnd = random(min: gameArea.minY, max: gameArea.maxY)
        
        let startPoint = CGPoint(x: randomXStart, y: randomYStart)
        let endPoint = CGPoint(x: randomXEnd, y: randomYEnd)
        
        let drinkNode = SKSpriteNode(imageNamed: drink.imageName)
        
        drinkNode.name = drink.drinkName
        drinkNode.setScale(drink.scale)
        drinkNode.position = startPoint
        drinkNode.zPosition = 2
        
        self.addChild(drinkNode)
        
        let moveDrink = SKAction.move(to: endPoint, duration: 20.0)
        let deleteDrink = SKAction.removeFromParent()
        let drinkSequence = SKAction.sequence([moveDrink, deleteDrink])
        
        drinkNode.run(drinkSequence)
        
        /*let dx = endPoint.x - startPoint.x
         let dy = endPoint.y - startPoint.y
         let amountToRotate = atan2(dy, dx)
         drink.zRotation = amountToRotate*/
        
        let spawn = SKAction.run({ self.createDrink(drink : drink)} )
        let waitToSpawn = SKAction.wait(forDuration: 10)
        let spawnSequence = SKAction.sequence([waitToSpawn, spawn])
        let spawnForever = SKAction.repeatForever(spawnSequence)
        self.run(spawnForever, withKey: "spawning" + drink.drinkName)
        
        drinkNode.alpha = 0
        fadeIn(drinkNode : drinkNode, drink : drink)
    }
    
    // Fade out an SKNode
    // Needs a drink object to control the fade duration
    func fadeOut(drinkNode : SKSpriteNode, drink : Drink) {
        let fade = SKAction.fadeOut(withDuration:drink.fadeOut)
        drinkNode.run(fade) {
            self.fadeIn(drinkNode : drinkNode, drink : drink)
        }
    }
    
    // Fade in an SKNode
    // Needs a drink object to control the fade duration
    func fadeIn(drinkNode : SKSpriteNode, drink : Drink) {
        let fade = SKAction.fadeIn(withDuration : drink.fadeIn)
        drinkNode.run(fade) {
            self.fadeOut(drinkNode : drinkNode, drink : drink)
        }
    }

    func random () -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
}


