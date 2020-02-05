//
//  Back.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 2/5/20.
//  Copyright © 2020 Vladislav Kondrashkov. All rights reserved.
//

struct Back: EasingFunction {
    func easeIn(_ x: Double) -> Double {
        return pow(x, 3) - x * sin(x * .pi)
    }

    func easeOut(_ x: Double) -> Double {
        let a = 1 - x
        return 1 - (pow(a, 3) - a * sin(a * .pi))
    }

    func easeInOut(_ x: Double) -> Double {
        if x < 0.5 {
            let a = 2 * x
            return 0.5 * (pow(a, 3) - a * sin(a * .pi))
        } else {
            let a = 1 - (2 * x - 1)
            return 0.5 * (1 - (pow(a, 3) - a * sin(a * .pi))) + 0.5
        }
    }
}
