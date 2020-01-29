//
//  AnimationValue.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

public protocol AnimationValue {
    func toCGFloat() -> CGFloat?
}

extension Int: AnimationValue {
    public func toCGFloat() -> CGFloat? {
        return CGFloat(self)
    }
}

extension UInt: AnimationValue {
    public func toCGFloat() -> CGFloat? {
        return CGFloat(self)
    }
}

extension Float: AnimationValue {
    public func toCGFloat() -> CGFloat? {
        return CGFloat(self)
    }
}

extension Double: AnimationValue {
    public func toCGFloat() -> CGFloat? {
        return CGFloat(self)
    }
}

extension CGFloat: AnimationValue {
    public func toCGFloat() -> CGFloat? {
        return self
    }
}

extension CGSize: AnimationValue {
    public func toCGFloat() -> CGFloat? {
        return nil
    }
}

extension CGPoint: AnimationValue {
    public func toCGFloat() -> CGFloat? {
        return nil
    }
}
