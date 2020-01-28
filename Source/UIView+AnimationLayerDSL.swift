//
//  UIView+AnimationLayer.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

public extension UIView {
    /**
     An object that can be used to run Lotus animation. Returns base layer's Lotus object.
     */
    var lotus: AnimationLayerDSL {
        return layer.lotus
    }
}
