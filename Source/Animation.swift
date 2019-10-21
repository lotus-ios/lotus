//
//  Animation.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

public final class Animation {
    let keyPath: String?
    let duration: AnimationValue
    let delay: AnimationValue
    let fromValue: AnimationValue
    let toValue: AnimationValue
    let easingType: EasingType
    let path: CGPath?

    var coreAnimation: CAAnimation {
        if path != nil {
            return pathCoreAnimation()
        } else {
            return valueCoreAnimation()
        }
    }

    init(keyPath: String?,
         duration: AnimationValue,
         delay: AnimationValue,
         fromValue: AnimationValue,
         toValue: AnimationValue,
         easingType: EasingType,
         path: CGPath?) {
        self.keyPath = keyPath
        self.duration = duration
        self.delay = delay
        self.fromValue = fromValue
        self.toValue = toValue
        self.easingType = easingType
        self.path = path
    }

    func valueCoreAnimation() -> CAKeyframeAnimation {
        let animation = CAKeyframeAnimation(keyPath: keyPath)
        animation.duration = duration as? CFTimeInterval ?? 0
        animation.values = EasingMaker().make(
            fromValue: fromValue,
            toValue: toValue,
            easingType: easingType
        )
        animation.beginTime = delay as? CFTimeInterval ?? 0
        animation.fillMode = .forwards
        animation.timingFunction = easingType.isComplex ?
            CAMediaTimingFunction(name: .linear) :
            easingType.timingFunction
        return animation
    }

    func pathCoreAnimation() -> CAKeyframeAnimation {
        let animation = CAKeyframeAnimation(keyPath: keyPath)
        animation.duration = duration as? CFTimeInterval ?? 0
        animation.path = path
        animation.beginTime = delay as? CFTimeInterval ?? 0
        animation.fillMode = .forwards
        animation.timingFunction = easingType.isComplex ?
            CAMediaTimingFunction(name: .linear) :
            easingType.timingFunction
        return animation
    }
}
