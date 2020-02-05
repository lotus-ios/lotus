//
//  EasingFunction.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 2/5/20.
//  Copyright © 2020 Vladislav Kondrashkov. All rights reserved.
//

protocol EasingFunction {
    func easeIn(_ x: Double) -> Double
    func easeOut(_ x: Double) -> Double
    func easeInOut(_ x: Double) -> Double
}
