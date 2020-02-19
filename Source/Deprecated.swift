//
//  Deprecated.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 2/19/20.
//  Copyright © 2020 Vladislav Kondrashkov. All rights reserved.
//

extension AnimationLayerDSL {
    /**
     Returns `AnimationMaker` object in closure that can be used to set up animation which would run after calling this method
     */
    @available(*, deprecated, renamed: "animate")
    @discardableResult
    public func runAnimation(_ closure: @escaping (AnimationMaker) -> Void) -> AnimationLayerChainDSL {
        return animate(closure)
    }
}
