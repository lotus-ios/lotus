//
//  AnimationMaker.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

public final class AnimationMaker {
    private let item: AnimatableItem
    private var descriptions: [AnimationDescription] = []

    public var motion: AnimationMakerAnimatable {
        return makeAnimatableWithAttribute(.position, fromValue: item.position)
    }

    public func motion(_ motionType: MotionType) -> AnimationMakerAnimatable {
        switch motionType {
        case .horizontal:
            return makeAnimatableWithAttribute(.horizontalPosition, fromValue: item.position.x)
        case .vertical:
            return makeAnimatableWithAttribute(.verticalPosition, fromValue: item.position.y)
        }
    }

    public var scaling: AnimationMakerAnimatable {
        return makeAnimatableWithAttribute(.scale, fromValue: item.scale)
    }

    public func scaling(_ scaleType: ScaleType) -> AnimationMakerAnimatable {
        switch scaleType {
        case .width:
            return makeAnimatableWithAttribute(.widthScale, fromValue: item.scaleX)
        case .height:
            return makeAnimatableWithAttribute(.heightScale, fromValue: item.scaleY)
        }
    }

    public var opacity: AnimationMakerAnimatable {
        return makeAnimatableWithAttribute(.opacity, fromValue: item.alpha)
    }

    public var rotation: AnimationMakerAnimatable {
        return makeAnimatableWithAttribute(.rotation, fromValue: item.rotation)
    }

    init(item: AnimatableItem) {
        self.item = item
    }

    private static func prepareAnimations(item: CALayer, closure: (_ make: AnimationMaker) -> Void) -> [Animation] {
        let maker = AnimationMaker(item: item)
        closure(maker)
        var animations: [Animation] = []
        for description in maker.descriptions {
            animations.append(description.animation)
        }
        return animations
    }

    // TODO: need to change property after animation completion
    /// to make animation sequences relatively to each other
    static func makeAnimation(item: CALayer, closure: (AnimationMaker) -> Void) -> CAAnimationGroup {
        let animations = prepareAnimations(item: item, closure: closure)
        let animationGroup = CAAnimationGroup()
        animationGroup.fillMode = .forwards
        animationGroup.isRemovedOnCompletion = false
        animationGroup.animations = animations.compactMap { $0.coreAnimation }
        let animationWithMaxDuration = animations.max(by: {
            let rhsTime = ($0.duration as? Double ?? 0) + ($0.delay as? Double ?? 0)
            let lhsTime = ($1.duration as? Double ?? 0) + ($1.delay as? Double ?? 0)
            return rhsTime < lhsTime
        })
        let duration = animationWithMaxDuration?.duration as? CFTimeInterval ?? 0
        let delay = animationWithMaxDuration?.delay as? CFTimeInterval ?? 0
        animationGroup.duration = duration + delay
        return animationGroup
    }

    private func makeAnimatableWithAttribute(_ attribute: AnimationAttribute,
                                             fromValue: AnimationValue) -> AnimationMakerAnimatable {
        let description = AnimationDescription(item: item, attribute: attribute)
        description.fromValue = fromValue
        descriptions.append(description)
        return AnimationMakerAnimatable(description: description)
    }
}
