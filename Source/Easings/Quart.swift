//
//  Quart.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 2/5/20.
//  Copyright © 2020 Vladislav Kondrashkov. All rights reserved.
//

struct Quart: EasingFunction {
    func easeIn(_ x: Double) -> Double {
        return pow(x, 4)
    }

    func easeOut(_ x: Double) -> Double {
        let a = x - 1
        return pow(a, 3) * (1 - x) + 1
    }

    func easeInOut(_ x: Double) -> Double {
        if x < 0.5 {
            return 8 * pow(x, 4)
        } else {
            let a = x - 1
            return -8 * pow(a, 4) + 1
        }
    }
}
