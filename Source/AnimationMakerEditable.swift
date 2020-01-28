//
//  AnimationMakerEditable.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

/**
 An object that can be used to set up animation's capabilities.
 */
public final class AnimationMakerEditable {
    let description: AnimationDescription

    init(description: AnimationDescription) {
        self.description = description
    }

    /**
    Sets animation's duration time. Returns `AnimationMakerEditable` object that can be used to set up animation capabilities.
    */
    @discardableResult
    public func during(_ value: AnimationValue) -> AnimationMakerEditable {
        description.duration = value
        return self
    }

    /**
    Sets animation's delaying time. Returns `AnimationMakerEditable` object that can be used to set up animation capabilities.
    */
    @discardableResult
    public func delay(_ value: AnimationValue) -> AnimationMakerEditable {
        description.delay = value
        return self
    }

    /**
    Sets animation's easing function. Returns `AnimationMakerEditable` object that can be used to set up animation capabilities.
    */
    @discardableResult
    public func ease(_ type: EasingType) -> AnimationMakerEditable {
        description.easingType = type
        return self
    }
}
