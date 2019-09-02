//
//  AnimationLayerChainDSL.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

public struct AnimationLayerChainDSL {
    let layer: AnimationLayer
    let animationStack: AnimationQueue

    init(layer: AnimationLayer, animationStack: AnimationQueue) {
        self.layer = layer
        self.animationStack = animationStack
    }

    @discardableResult
    public func then(_ closure: (AnimationMaker) -> Void) -> AnimationLayerChainDSL {
        let animationGroup = AnimationMaker.makeAnimation(item: layer, closure: closure)
        animationStack.push(animationGroup)
        return AnimationLayerChainDSL(layer: layer, animationStack: animationStack)
    }
}
