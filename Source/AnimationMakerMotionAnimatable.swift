//
//  AnimationMakerMotionAnimatable.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 2/14/20.
//  Copyright © 2020 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

/**
 An object that can be used to set up motion animation's path.
 */
public final class AnimationMakerMotionAnimatable {
    let description: AnimationDescription

    init(description: AnimationDescription) {
        self.description = description
    }

    /**
     Sets motion animation's path. Returns `AnimationMakerEditable` object that can be used to set up animation capabilities.
     */
    @discardableResult
    public func along(_ value: PathValue) -> AnimationMakerEditable {
        description.path = value.pathValue()
        return AnimationMakerEditable(description: description)
    }

    /**
     Sets animation's destination value. Returns `AnimationMakerEditable` object that can be used to set up animation capabilities.
     */
    @discardableResult
    public func to(_ value: CGPoint) -> AnimationMakerEditable {
        let path = UIBezierPath()
        path.move(to: description.item.position)
        path.addLine(to: value)
        description.path = path.cgPath
        return AnimationMakerEditable(description: description)
    }
}
