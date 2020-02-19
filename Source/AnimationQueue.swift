//
//  AnimationQueue.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 9/18/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

final class AnimationQueue: NSObject {
    private lazy var identifier = String(describing: ObjectIdentifier(self))

    private let layer: CALayer
    private var closures: [(AnimationMaker) -> Void] = []

    init(layer: CALayer) {
        self.layer = layer
    }

    func run() {
        guard let closure = dequeue() else {
            return
        }
        guard let animationGroup = AnimationMaker.makeAnimation(item: layer, closure: closure) else {
            return
        }
        animationGroup.delegate = self
        layer.add(animationGroup, forKey: identifier)
    }

    func enqueue(_ closure: ((AnimationMaker) -> Void)?) {
        guard let closure = closure else {
            return
        }
        closures.append(closure)
    }

    @discardableResult
    func dequeue() -> ((AnimationMaker) -> Void)? {
        guard closures.count > 0 else {
            return nil
        }
        return closures.removeFirst()
    }
}

// MARK: - CAAnimationDelegate implementation

extension AnimationQueue: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        /// Synchronizing Presentation tree with Model tree
        if let presentationLayer = layer.presentation() {
            layer.transform = presentationLayer.transform
            layer.opacity = presentationLayer.opacity
            layer.position = presentationLayer.position
        }
        layer.removeAnimation(forKey: identifier)
        run()
    }
}
