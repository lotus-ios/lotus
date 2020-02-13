//
//  Circ.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 2/5/20.
//  Copyright © 2020 Vladislav Kondrashkov. All rights reserved.
//

struct Circ: EasingFunction {
    func easeIn(_ x: Double) -> Double {
        return 1 - sqrt(1 - pow(x, 2))
    }

    func easeOut(_ x: Double) -> Double {
        return sqrt((2 - x) * x)
    }

    func easeInOut(_ x: Double) -> Double {
        if x < 0.5 {
            return 0.5 * (1 - sqrt(1 - 4 * pow(x, 2)))
        } else {
            return 0.5 * (sqrt(-((2 * x) - 3) * ((2 * x) - 1)) + 1)
        }
    }
}
