//
//  EasingType.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 9/7/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

public enum EasingType {
    var isComplex: Bool {
        return self.timingFunction == nil
    }

    case custom(CAMediaTimingFunction)

    // MARK: - CoreAnimation defaults

    case linear
    case defaultIn
    case defaultOut
    case defaultInOut

    // MARK: - Sine

    case inSine
    case outSine
    case inOutSine

    // MARK: - Quad

    case inQuad
    case outQuad
    case inOutQuad

    // MARK: - Cubic

    case inCubic
    case outCubic
    case inOutCubic

    // MARK: - Quart

    case inQuart
    case outQuart
    case inOutQuart

    // MARK: - Quint

    case inQuint
    case outQuint
    case inOutQuint

    // MARK: - Expo

    case inExpo
    case outExpo
    case inOutExpo

    // MARK: - Circ

    case inCirc
    case outCirc
    case inOutCirc

    // MARK: - Back

    case inBack
    case outBack
    case inOutBack

    // MARK: - Elastic

    case inElastic
    case outElastic
    case inOutElastic
}
