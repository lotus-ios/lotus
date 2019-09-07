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
    var opacity: Float { get }
    var rotation: Float { get }
}

extension CALayer: AnimatableItem {
    public var scale: CGFloat {
        let presentationLayer = self.presentation() ?? self
        _ = presentationLayer.affineTransform() // let transform
        // For some reason scale animation doesn't change matrix
        // and even resets it to .identity
        // return sqrt(transform.a * transform.a + transform.c * transform.c)
        return 1.0
    }

    public var scaleX: CGFloat {
        let presentationLayer = self.presentation() ?? self
        let transform = presentationLayer.affineTransform()
        return transform.a
    }

    public var scaleY: CGFloat {
        let presentationLayer = self.presentation() ?? self
        let transform = presentationLayer.affineTransform()
        return transform.d
    }

    public var rotation: Float {
        let presentationLayer = self.presentation() ?? self
        let transform = presentationLayer.affineTransform()
        return atan2f(Float(transform.b), Float(transform.a))
    }
}
