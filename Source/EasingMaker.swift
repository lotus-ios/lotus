//
//  EasingMaker.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 9/7/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

final class EasingMaker {
    /**
     Calculates list of values for specifed type of easing. Returns linear function
     whether easing isn't complex. Not complex easing functions should use .timingFunction
     instead.

     - Parameters:
        - fromValue: Starting value of function.
        - toValue: Ending value of functtion.
        - easingType: Type of complex easing function.
     - Returns: List of values for specified type of easing and according to given boundaries.
     */
    func make(fromValue: CGFloat,
              toValue: CGFloat,
              easingType: EasingType) -> [CGFloat] {
        guard let function = easingType.function else {
            return [fromValue, toValue]
        }
        var values: [CGFloat] = []
        let keyframesCount = 120
        var t: Double = 0
        let dt = 1 / Double(keyframesCount - 1)

        for _ in 0..<keyframesCount {
            values.append(fromValue + CGFloat(function(t)) * (toValue - fromValue))
            t += dt
        }

        return values
    }
}
