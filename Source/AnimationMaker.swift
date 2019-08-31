//
//  AnimationMaker.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

public class AnimationMaker {
    private let item: AnimatableItem
    private var descriptions: [AnimationDescription] = []

    public var motion: AnimationMakerAnimatable {
        return makeAnimatableWithAttribute(.position, type: .vector)
    }
    public func motion(_ motionType: MotionType) -> AnimationMakerAnimatable {
        switch motionType {
        case .horizontal:
            return makeAnimatableWithAttribute(.horizontalPosition, type: .vector)
        case .vertical:
            return makeAnimatableWithAttribute(.verticalPosition, type: .vector)
        }
    }
    public var scaling: AnimationMakerAnimatable {
        return makeAnimatableWithAttribute(.scale, type: .scalar)
    }
    public func scaling(_ scaleType: ScaleType) -> AnimationMakerAnimatable {
        switch scaleType {
        case .width:
            return makeAnimatableWithAttribute(.widthScale, type: .scalar)
        case .height:
            return makeAnimatableWithAttribute(.heightScale, type: .scalar)
        }
    }
    public var opacity: AnimationMakerAnimatable {
        return makeAnimatableWithAttribute(.opacity, type: .scalar)
    }
    public var rotation: AnimationMakerAnimatable {
        return makeAnimatableWithAttribute(.rotation, type: .scalar)
    }

    init(item: AnimatableItem) {
        self.item = item
    }

    private static func prepareAnimations(item: AnimationLayer, closure: (_ make: AnimationMaker) -> Void) -> [Animation] {
        let maker = AnimationMaker(item: item)
        closure(maker)
        var animations: [Animation] = []
        for description in maker.descriptions {
            animations.append(description.animation)
        }
        return animations
    }

    static func makeAnimation(item: AnimationLayer, closure: (AnimationMaker) -> Void) -> CAAnimationGroup {
        let animations = prepareAnimations(item: item, closure: closure)
        let animationGroup = CAAnimationGroup()
        animationGroup.fillMode = .forwards
        animationGroup.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
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

    private func makeAnimatableWithAttribute(_ attribute: AnimationAttribute, type: AnimationType) -> AnimationMakerAnimatable {
        let description = AnimationDescription(item: item, attribute: attribute, type: type)
        descriptions.append(description)
        return AnimationMakerAnimatable(description: description)
    }
}

