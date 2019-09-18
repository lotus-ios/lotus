//
//  AnimationLayerChainDSL.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

public struct AnimationLayerChainDSL {
    let layer: CALayer
    let animationMakerQueue: AnimationMakerQueue

    init(layer: CALayer, animationMakerQueue: AnimationMakerQueue) {
        self.layer = layer
        self.animationMakerQueue = animationMakerQueue
    }

    @discardableResult
    public func then(_ closure: @escaping (AnimationMaker) -> Void) -> AnimationLayerChainDSL {
        animationMakerQueue.push(closure)
        return AnimationLayerChainDSL(layer: layer, animationMakerQueue: animationMakerQueue)
    }
}
