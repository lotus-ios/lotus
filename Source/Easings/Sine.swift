//
//  Sine.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 2/5/20.
//  Copyright © 2020 Vladislav Kondrashkov. All rights reserved.
//

struct Sine: EasingFunction {
    func easeIn(_ x: Double) -> Double {
        return sin((x - 1) * .pi / 2) + 1
    }

    func easeOut(_ x: Double) -> Double {
        return sin(x * .pi / 2)
    }

    func easeInOut(_ x: Double) -> Double {
        return 0.5 * (1 - cos(x * .pi))
    }
}
