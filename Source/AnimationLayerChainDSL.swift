//
//  AnimationLayerChainDSL.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

public struct AnimationLayerChainDSL {
    let layer: CALayer
    let animationQueue: AnimationQueue

    init(layer: CALayer, animationQueue: AnimationQueue) {
        self.layer = layer
        self.animationQueue = animationQueue
    }

    @discardableResult
    public func then(_ closure: @escaping (AnimationMaker) -> Void) -> AnimationLayerChainDSL {
        animationQueue.enqueue(closure)
        return AnimationLayerChainDSL(layer: layer, animationQueue: animationQueue)
    }
}
