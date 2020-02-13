//
//  Animation.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

final class Animation {
    let keyPath: String?
    let duration: Double
    let delay: Double
    let fromValue: CGFloat
    let toValue: CGFloat
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
         duration: Double,
         delay: Double,
         fromValue: CGFloat,
         toValue: CGFloat,
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
        animation.duration = duration
        animation.values = EasingMaker().make(
            fromValue: fromValue,
            toValue: toValue,
            easingType: easingType
        )
        animation.beginTime = delay
        animation.fillMode = .forwards
        animation.timingFunction = easingType.isComplex ?
            CAMediaTimingFunction(name: .linear) :
            easingType.timingFunction
        return animation
    }

    func pathCoreAnimation() -> CAKeyframeAnimation {
        let animation = CAKeyframeAnimation(keyPath: keyPath)
        animation.duration = duration
        animation.path = path
        animation.beginTime = delay
        animation.fillMode = .forwards
        animation.timingFunction = easingType.isComplex ?
            CAMediaTimingFunction(name: .linear) :
            easingType.timingFunction
        return animation
    }
}
