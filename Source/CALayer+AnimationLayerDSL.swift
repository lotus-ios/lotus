//
//  AnimationLayer.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

public extension CALayer {
    /**
     An object that can be used to run Lotus animations.
     */
    var lotus: AnimationLayerDSL {
        return AnimationLayerDSL(layer: self)
    }
}
