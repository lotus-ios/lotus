//
//  AnimationMakerAnimatable.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

/**
 An object that can be used to set up animation's final value or destination.
 */
public final class AnimationMakerAnimatable {
    let description: AnimationDescription

    init(description: AnimationDescription) {
        self.description = description
    }

    /**
     Sets animation's final or destination value. Returns `AnimationMakerEditable` object that can be used to set up animation capabilities.
     */
    @discardableResult
    public func to(_ value: AnimationValue) -> AnimationMakerEditable {
        description.toValue = value.animationValueFor(animationAttribute: description.attribute)
        return AnimationMakerEditable(description: description)
    }
}
