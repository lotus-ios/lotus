//
//  AnimationLayerChainDSL.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

/**
 An object that provides method to declare and run chained animations
 */
public struct AnimationLayerChainDSL {
    let layer: CALayer
    let animationQueue: AnimationQueue

    init(layer: CALayer, animationQueue: AnimationQueue) {
        self.layer = layer
        self.animationQueue = animationQueue
    }

    /**
     Returns `AnimationMaker` object in closure that can be used to set up animation which would run after previous animation will have finished.
     */
    @discardableResult
    public func then(_ closure: @escaping (AnimationMaker) -> Void) -> AnimationLayerChainDSL {
        animationQueue.enqueue(closure)
        return AnimationLayerChainDSL(layer: layer, animationQueue: animationQueue)
    }
}
