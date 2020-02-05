//
//  EasingType+CAMediaTimingFunction.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 9/7/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

extension EasingType {
    var timingFunction: CAMediaTimingFunction? {
        switch self {
        case .linear:
            return CAMediaTimingFunction(name: .linear)
        case .defaultIn:
            return CAMediaTimingFunction(name: .easeIn)
        case .defaultOut:
            return CAMediaTimingFunction(name: .easeOut)
        case .defaultInOut:
            return CAMediaTimingFunction(name: .easeInEaseOut)
        default:
            return nil
        }
    }
}
