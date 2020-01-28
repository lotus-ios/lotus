//
//  AnimationLayerDSL.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

/**
 An object that provides method to declare and run animations
 */
public struct AnimationLayerDSL {
    let layer: CALayer
    let animationQueue: AnimationQueue

    init(layer: CALayer) {
        self.layer = layer
        animationQueue = AnimationQueue(layer: layer)
    }

    /**
     Returns `AnimationMaker` object in closure that can be used to set up animation which would run after calling this method
     */
    @discardableResult
    public func runAnimation(_ closure: @escaping (AnimationMaker) -> Void) -> AnimationLayerChainDSL {
        animationQueue.enqueue(closure)
        animationQueue.run()
        return AnimationLayerChainDSL(layer: layer, animationQueue: animationQueue)
    }
}
