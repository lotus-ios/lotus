//
//  AnimationValue.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

public protocol AnimationValue {}

extension Int: AnimationValue {}

extension UInt: AnimationValue {}

extension Float: AnimationValue {}

extension Double: AnimationValue {}

extension CGFloat: AnimationValue {}

extension CGSize: AnimationValue {}

extension CGPoint: AnimationValue {}

extension AnimationValue {
    func animationValueFor(animationAttribute: AnimationAttribute) -> CGFloat {
        if let value = self as? CGFloat {
            return value
        }

        if let value = self as? Float {
            return CGFloat(value)
        }

        if let value = self as? Double {
            return CGFloat(value)
        }

        if let value = self as? Int {
            return CGFloat(value)
        }

        if let value = self as? UInt {
            return CGFloat(value)
        }

        if let value = self as? CGSize {
            if animationAttribute == .widthScale {
                return value.width
            } else if animationAttribute == .heightScale {
                return value.height
            } else {
                return 0
            }
        }

        return 0
    }

    func timeValue() -> Double {
        if let value = self as? CGFloat {
            return Double(value)
        }

        if let value = self as? Float {
            return Double(value)
        }

        if let value = self as? Double {
            return value
        }

        if let value = self as? Int {
            return Double(value)
        }

        if let value = self as? UInt {
            return Double(value)
        }

        return 0
    }
}
