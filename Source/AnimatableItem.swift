//
//  AnimatableItem.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

public protocol AnimatableItem: AnyObject {
    var position: CGPoint { get }
    var scale: CGFloat { get }
    var scaleX: CGFloat { get }
    var scaleY: CGFloat { get }
    var alpha: CGFloat { get }
    var rotation: CGFloat { get }
}

extension CALayer: AnimatableItem {
    public var scale: CGFloat {
        return sqrt(transform.m11 + transform.m22)
    }

    public var scaleX: CGFloat {
        let transform = affineTransform()
        return transform.a
    }

    public var scaleY: CGFloat {
        let transform = affineTransform()
        return transform.d
    }

    public var alpha: CGFloat {
        return CGFloat(opacity)
    }

    public var rotation: CGFloat {
        let transform = affineTransform()
        return CGFloat(atan2f(Float(transform.b), Float(transform.a)))
    }
}
