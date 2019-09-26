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
        switch easingType {
        case .inElastic:
            return inElastic(fromValue: fromValue, toValue: toValue)
        case .outElastic:
            return outElastic(fromValue: fromValue, toValue: toValue)
        case .inOutElastic:
            return inOutElastic(fromValue: fromValue, toValue: toValue)
        default:
            return [fromValue, toValue]
        }
    }
}

// MARK: - Elastic

private extension EasingMaker {
    func inElastic(fromValue: CGFloat, toValue: CGFloat) -> [CGFloat] {
        return [
            fromValue,
            toValue * 0.0004,
            toValue * 0.0016,
            toValue * 0.0017,
            toValue * -0.0004,
            toValue * -0.0058,
            toValue * -0.0055,
            toValue * 0.0156,
            toValue * 0.0164,
            toValue * -0.0463,
            toValue * -0.044,
            toValue * 0.1312,
            toValue * -0.3706,
            toValue,
        ]
    }

    func outElastic(fromValue: CGFloat, toValue: CGFloat) -> [CGFloat] {
        return [
            fromValue,
            toValue * 1.3227,
            toValue * 0.8688,
            toValue * 1.0463,
            toValue * 0.9836,
            toValue * 1.0058,
            toValue * 0.998,
            toValue,
        ]
    }

    func inOutElastic(fromValue: CGFloat, toValue: CGFloat) -> [CGFloat] {
        return [
            fromValue,
            toValue * 0.0008,
            toValue * 0.0010,
            toValue * -0.0052,
            toValue * -0.0039,
            toValue * 0.0235,
            toValue * 0.0239,
            toValue * -0.0927,
            toValue * 1.1175,
            toValue * 1.0927,
            toValue * 0.9761,
            toValue * 0.9765,
            toValue * 1.0052,
            toValue * 0.9997,
            toValue * 0.999,
            toValue,
        ]
    }
}
