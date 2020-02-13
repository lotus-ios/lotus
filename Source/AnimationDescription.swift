//
//  AnimationDescription.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

final class AnimationDescription {
    let item: AnimatableItem
    let attribute: AnimationAttribute

    var duration: AnimationValue = 0.3
    var delay: AnimationValue = 0.0
    var fromValue: AnimationValue = 0.0
    var toValue: AnimationValue = 0.0
    var easingType: EasingType = .linear
    var path: CGPath?

    var keyPath: String {
        return attribute.rawValue
    }

    lazy var animation: Animation = {
        Animation(
            keyPath: keyPath,
            duration: duration.timeValue(),
            delay: delay.timeValue(),
            fromValue: fromValue.animationValueFor(animationAttribute: attribute),
            toValue: toValue.animationValueFor(animationAttribute: attribute),
            easingType: easingType,
            path: path
        )
    }()

    init(item: AnimatableItem, attribute: AnimationAttribute) {
        self.item = item
        self.attribute = attribute
    }
}
