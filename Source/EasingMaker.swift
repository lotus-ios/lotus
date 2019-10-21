//
//  EasingMaker.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 9/7/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

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
    func make(fromValue: AnimationValue,
              toValue: AnimationValue,
              easingType: EasingType) -> [CGFloat] {
        guard let fromValue = fromValue as? CGFloat,
            let toValue = toValue as? CGFloat else {
            assertionFailure("Can't make timing function! Given wrong type!")
            return []
        }
        return [fromValue, toValue]
    }
}
