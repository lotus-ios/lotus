//
//  EasingType+CAMediaTimingFunction.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 9/7/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

extension EasingType {
    var timingFunction: CAMediaTimingFunction? {
        switch self {
        case .custom(let timingFunction):
            return timingFunction
        case .linear:
            return CAMediaTimingFunction(name: .linear)
        case .defaultIn:
            return CAMediaTimingFunction(name: .easeIn)
        case .defaultOut:
            return CAMediaTimingFunction(name: .easeOut)
        case .defaultInOut:
            return CAMediaTimingFunction(name: .easeInEaseOut)
        case .inSine:
            return CAMediaTimingFunction(controlPoints: 0.47, 0.0, 0.745, 0.715)
        case .outSine:
            return CAMediaTimingFunction(controlPoints: 0.39, 0.575, 0.565, 1.0)
        case .inOutSine:
            return CAMediaTimingFunction(controlPoints: 0.445, 0.05, 0.55, 0.95)
        case .inQuad:
            return CAMediaTimingFunction(controlPoints: 0.55, 0.085, 0.68, 0.53)
        case .outQuad:
            return CAMediaTimingFunction(controlPoints: 0.25, 0.46, 0.45, 0.94)
        case .inOutQuad:
            return CAMediaTimingFunction(controlPoints: 0.455, 0.03, 0.515, 0.955)
        case .inCubic:
            return CAMediaTimingFunction(controlPoints: 0.55, 0.055, 0.675, 0.19)
        case .outCubic:
            return CAMediaTimingFunction(controlPoints: 0.215, 0.61, 0.355, 1.0)
        case .inOutCubic:
            return CAMediaTimingFunction(controlPoints: 0.645, 0.045, 0.355, 1.0)
        case .inQuart:
            return CAMediaTimingFunction(controlPoints: 0.895, 0.03, 0.685, 0.22)
        case .outQuart:
            return CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1.0)
        case .inOutQuart:
            return CAMediaTimingFunction(controlPoints: 0.77, 0.0, 0.175, 1.0)
        case .inQuint:
            return CAMediaTimingFunction(controlPoints: 0.755, 0.05, 0.855, 0.06)
        case .outQuint:
            return CAMediaTimingFunction(controlPoints: 0.23, 1.0, 0.32, 1.0)
        case .inOutQuint:
            return CAMediaTimingFunction(controlPoints: 0.86, 0.0, 0.07, 1.0)
        case .inExpo:
            return CAMediaTimingFunction(controlPoints: 0.95, 0.05, 0.795, 0.035)
        case .outExpo:
            return CAMediaTimingFunction(controlPoints: 0.19, 1.0, 0.22, 1.0)
        case .inOutExpo:
            return CAMediaTimingFunction(controlPoints: 1.0, 0.0, 0.0, 1.0)
        case .inCirc:
            return CAMediaTimingFunction(controlPoints: 0.6, 0.04, 0.98, 0.335)
        case .outCirc:
            return CAMediaTimingFunction(controlPoints: 0.075, 0.82, 0.165, 1.0)
        case .inOutCirc:
            return CAMediaTimingFunction(controlPoints: 0.785, 0.135, 0.15, 0.86)
        case .inBack:
            return CAMediaTimingFunction(controlPoints: 0.6, -0.28, 0.735, 0.045)
        case .outBack:
            return CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
        case .inOutBack:
            return CAMediaTimingFunction(controlPoints: 0.68, -0.55, 0.265, 1.55)
        }
    }
}
