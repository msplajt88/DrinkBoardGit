//
//  Drink.swift
//  DrinkBoard
//
//  Created by Marko Šplajt on 24/11/2018.
//  Copyright © 2018 MarkoSplajt. All rights reserved.
//

import Foundation
import UIKit

class Drink {
    // Name of the image file
    var imageName : String
    
    // Name of the SKNode
    var drinkName : String
    
    // SKNode scale
    var scale : CGFloat
    
    // Fade in duration
    var fadeIn : Double
    
    // Fade out duration
    var fadeOut : Double
    
    init(_imageName : String, _drinkName : String, _scale : CGFloat, _fadeIn : Double, _fadeOut : Double) {
        imageName = _imageName
        drinkName = _drinkName
        scale = _scale
        fadeIn = _fadeIn
        fadeOut = _fadeOut
    }
}
