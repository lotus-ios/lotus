//
//  Expo.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 2/5/20.
//  Copyright © 2020 Vladislav Kondrashkov. All rights reserved.
//

struct Expo: EasingFunction {
    func easeIn(_ x: Double) -> Double {
        return x == 0 ? x : pow(2, 10 * (x - 1))
    }

    func easeOut(_ x: Double) -> Double {
        return x == 1 ? x : 1 - pow(2, -10 * x)
    }

    func easeInOut(_ x: Double) -> Double {
        guard x != 0, x != 1 else {
            return x
        }

        if x < 0.5 {
            return 0.5 * pow(2, (20 * x) - 10)
        } else {
            return -0.5 * pow(2, (-20 * x) + 10) + 1
        }
    }
}
