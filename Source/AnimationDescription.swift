//
//  AnimationDescription.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

public final class AnimationDescription {
    let item: AnimatableItem
    let attribute: AnimationAttribute
    let type: AnimationType

    var duration: AnimationValue = 0.3
    var delay: AnimationValue = 0.0
    var value: AnimationValue = 0.0
    var path: CGPath? = nil

    var keyPath: String {
        return attribute.rawValue
    }

    lazy var animation: Animation = {
        return Animation(
            type: type,
            keyPath: keyPath,
            duration: duration,
            delay: delay,
            value: value,
            path: path
        )
    }()

    init(item: AnimatableItem, attribute: AnimationAttribute, type: AnimationType) {
        self.item = item
        self.attribute = attribute
        self.type = type
    }
}
