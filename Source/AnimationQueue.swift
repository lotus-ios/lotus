//
//  AnimationMakerQueue.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 9/18/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

final class AnimationQueue: NSObject {
    private let layer: CALayer
    private var closures: [(AnimationMaker) -> Void] = []

    init(layer: CALayer) {
        self.layer = layer
    }

    func run() {
        guard let closure = dequeue() else {
            return
        }
        let animationGroup = AnimationMaker.makeAnimation(item: layer, closure: closure)
        animationGroup.delegate = self
        layer.add(animationGroup, forKey: nil)
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
        run()
    }
}

