//
//  Animation.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

public final class Animation {
    let type: AnimationType
    let keyPath: String?
    let duration: AnimationValue
    let delay: AnimationValue
    let value: AnimationValue
    let path: CGPath?

    var coreAnimation: CAAnimation {
        switch type {
        case .scalar:
            return prepareScalarAnimation()
        case .vector:
            return prepareVectorAnimation()
        }
    }

    init(type: AnimationType,
         keyPath: String?,
         duration: AnimationValue,
         delay: AnimationValue,
         value: AnimationValue,
         path: CGPath?) {
        self.type = type
        self.keyPath = keyPath
        self.duration = duration
        self.delay = delay
        self.value = value
        self.path = path
    }

    func prepareScalarAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: keyPath)
        animation.duration = duration as? CFTimeInterval ?? 0
        animation.toValue = value
        animation.beginTime = delay as? CFTimeInterval ?? 0
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        return animation
    }

    func prepareVectorAnimation() -> CAKeyframeAnimation {
        let animation = CAKeyframeAnimation(keyPath: keyPath)
        animation.duration = duration as? CFTimeInterval ?? 0
        animation.path = path
        animation.beginTime = delay as? CFTimeInterval ?? 0
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        return animation
    }
}
