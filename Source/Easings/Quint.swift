//
//  Quint.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 2/5/20.
//  Copyright © 2020 Vladislav Kondrashkov. All rights reserved.
//

struct Quint: EasingFunction {
    func easeIn(_ x: Double) -> Double {
        return pow(x, 5)
    }

    func easeOut(_ x: Double) -> Double {
        let a = x - 1
        return pow(a, 5) + 1
    }

    func easeInOut(_ x: Double) -> Double {
        if x < 0.5 {
            return 16 * pow(x, 5)
        } else {
            let a = (2 * x) - 2
            return 0.5 * pow(a, 5) + 1
        }
    }
}
