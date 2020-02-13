//
//  AnimationMaker.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

/**
 An object that can be used to set up animation's type.
 */
public final class AnimationMaker {
    private let item: AnimatableItem
    private var descriptions: [AnimationDescription] = []

    /**
     An object that describes position animation on X and Y axes.
     */
    public var motion: AnimationMakerAnimatable {
        return makeAnimatableWithAttribute(.position, fromValue: item.position)
    }

    /**
     An object that describes position animation on axis passed as argument.
     */
    public func motion(_ motionType: MotionType) -> AnimationMakerAnimatable {
        switch motionType {
        case .horizontal:
            return makeAnimatableWithAttribute(.horizontalPosition, fromValue: item.position.x)
        case .vertical:
            return makeAnimatableWithAttribute(.verticalPosition, fromValue: item.position.y)
        }
    }

    /**
     An object that describes scale animation in width and height.
     */
    public var scaling: AnimationMakerAnimatable {
        return makeAnimatableWithAttribute(.scale, fromValue: item.scale)
    }

    /**
     An object that describes scale animation on dimension passed as argument.
     */
    public func scaling(_ scaleType: ScaleType) -> AnimationMakerAnimatable {
        switch scaleType {
        case .width:
            return makeAnimatableWithAttribute(.widthScale, fromValue: item.scaleX)
        case .height:
            return makeAnimatableWithAttribute(.heightScale, fromValue: item.scaleY)
        }
    }

    /**
     An object that describes transparency animation.
     */
    public var opacity: AnimationMakerAnimatable {
        return makeAnimatableWithAttribute(.opacity, fromValue: item.alpha)
    }

    /**
     An object that describes rotating animation/
     */
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

    static func makeAnimation(item: CALayer, closure: (AnimationMaker) -> Void) -> CAAnimationGroup {
        let animations = prepareAnimations(item: item, closure: closure)
        let animationGroup = CAAnimationGroup()
        animationGroup.fillMode = .forwards
        animationGroup.isRemovedOnCompletion = false
        animationGroup.animations = animations.compactMap { $0.coreAnimation }
        let animationWithMaxDuration = animations.max(by: {
            let rhsTime = $0.duration.timeValue() + $0.delay.timeValue()
            let lhsTime = $1.duration.timeValue() + $1.delay.timeValue()
            return rhsTime < lhsTime
        })
        let duration = animationWithMaxDuration?.duration.timeValue() ?? 0
        let delay = animationWithMaxDuration?.delay.timeValue() ?? 0
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
