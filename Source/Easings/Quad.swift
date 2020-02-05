//
//  Quad.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 2/5/20.
//  Copyright © 2020 Vladislav Kondrashkov. All rights reserved.
//

struct Quad: EasingFunction {
    func easeIn(_ x: Double) -> Double {
        return pow(x, 2)
    }

    func easeOut(_ x: Double) -> Double {
        return -(x * (x - 2))
    }

    func easeInOut(_ x: Double) -> Double {
        if x < 0.5 {
            return 2 * pow(x, 2)
        } else {
            return (-2 * pow(x, 2)) + (4 * x) - 1
        }
    }
}
