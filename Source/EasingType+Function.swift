//
//  EasingType+Function.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 2/5/20.
//  Copyright © 2020 Vladislav Kondrashkov. All rights reserved.
//

extension EasingType {
    var function: ((_ x: Double) -> Double)? {
        switch self {
        case .custom:
            return nil
        case .linear:
            return nil
        case .defaultIn:
            return nil
        case .defaultOut:
            return nil
        case .defaultInOut:
            return nil
        case .inSine:
            return Sine().easeIn
        case .outSine:
            return Sine().easeOut
        case .inOutSine:
            return Sine().easeInOut
        case .inQuad:
            return Quad().easeIn
        case .outQuad:
            return Quad().easeOut
        case .inOutQuad:
            return Quad().easeInOut
        case .inCubic:
            return Cubic().easeIn
        case .outCubic:
            return Cubic().easeOut
        case .inOutCubic:
            return Cubic().easeInOut
        case .inQuart:
            return Quart().easeIn
        case .outQuart:
            return Quart().easeOut
        case .inOutQuart:
            return Quart().easeInOut
        case .inQuint:
            return Quint().easeIn
        case .outQuint:
            return Expo().easeOut
        case .inOutQuint:
            return Quint().easeInOut
        case .inExpo:
            return Expo().easeIn
        case .outExpo:
            return Expo().easeOut
        case .inOutExpo:
            return Expo().easeInOut
        case .inCirc:
            return Circ().easeIn
        case .outCirc:
            return Circ().easeOut
        case .inOutCirc:
            return Circ().easeInOut
        case .inBack:
            return Back().easeIn
        case .outBack:
            return Back().easeOut
        case .inOutBack:
            return Back().easeInOut
        }
    }
}
