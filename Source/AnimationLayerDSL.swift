//
//  AnimationLayerDSL.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

public struct AnimationLayerDSL {
    let layer: AnimationLayer
    let animationStack: AnimationStack

    init(layer: AnimationLayer) {
        self.layer = layer
        self.animationStack = AnimationStack(layer: layer)
    }

    @discardableResult
    public func runAnimation(_ closure: (AnimationMaker) -> Void) -> AnimationLayerChainDSL {
        let animationGroup = AnimationMaker.makeAnimation(item: layer, closure: closure)
        animationStack.push(animationGroup)
        return AnimationLayerChainDSL(layer: layer, animationStack: animationStack)
    }
}
