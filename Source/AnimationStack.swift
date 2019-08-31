//
//  AnimationStack.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

final class AnimationStack: NSObject {
    private let layer: AnimationLayer
    private var animations: [CAAnimationGroup] = []

    init(layer: AnimationLayer) {
        self.layer = layer
    }

    func push(_ animation: CAAnimationGroup) {
        animations.append(animation)
    }

    @discardableResult
    func pop() -> CAAnimationGroup? {
        guard animations.count > 1 else {
            return nil
        }
        return animations.removeFirst()
    }
}

// MARK: - CAAnimationDelegate implementation
extension AnimationStack: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard let animation = self.pop() else {
            return
        }
        animation.delegate = self
        layer.add(animation, forKey: nil)
    }
}
