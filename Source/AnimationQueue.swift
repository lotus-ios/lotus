//
//  AnimationQueue.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

final class AnimationQueue: NSObject {
    private let layer: CALayer
    private var animations: [CAAnimationGroup] = []

    init(layer: CALayer) {
        self.layer = layer
        super.init()
    }

    func run() {
        guard let animation = self.pop() else {
            return
        }
        animation.delegate = self
        layer.add(animation, forKey: nil)
    }

    func push(_ animation: CAAnimationGroup) {
        animations.append(animation)
    }

    @discardableResult
    func pop() -> CAAnimationGroup? {
        guard animations.count > 0 else {
            return nil
        }
        return animations.removeFirst()
    }
}

// MARK: - CAAnimationDelegate implementation
extension AnimationQueue: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        run()
    }
}
