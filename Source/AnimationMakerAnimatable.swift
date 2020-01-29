//
//  AnimationMakerAnimatable.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

/**
 An object that can be used to set up animation's final value or destination.
 */
public final class AnimationMakerAnimatable {
    let description: AnimationDescription

    init(description: AnimationDescription) {
        self.description = description
    }

    /**
     Sets animation's final or destination value. Returns `AnimationMakerEditable` object that can be used to set up animation capabilities.
     */
    @discardableResult
    public func to(_ value: AnimationValue) -> AnimationMakerEditable {
        if let point = value as? CGPoint {
            let path = UIBezierPath()
            path.move(to: description.item.position)
            path.addLine(to: point)
            description.path = path.cgPath
        } else if let double = value as? Double {
            description.toValue = CGFloat(double)
        } else {
            description.toValue = value
        }
        return AnimationMakerEditable(description: description)
    }
}
