//
//  AnimationLayerDSL.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

public struct AnimationLayerDSL {
    let layer: CALayer
    let animationMakerQueue: AnimationMakerQueue

    init(layer: CALayer) {
        self.layer = layer
        self.animationMakerQueue = AnimationMakerQueue(layer: layer)
    }

    @discardableResult
    public func runAnimation(_ closure: @escaping (AnimationMaker) -> Void) -> AnimationLayerChainDSL {
        animationMakerQueue.push(closure)
        animationMakerQueue.run()
        return AnimationLayerChainDSL(layer: layer, animationMakerQueue: animationMakerQueue)
    }
}
