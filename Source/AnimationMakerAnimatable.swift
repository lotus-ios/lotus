//
//  AnimationMakerAnimatable.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

public class AnimationMakerAnimatable {
    let description: AnimationDescription

    init(description: AnimationDescription) {
        self.description = description
    }

    @discardableResult
    public func to(_ value: AnimationValue) -> AnimationMakerEditable {
        if let point = value as? CGPoint {
            let path = UIBezierPath()
            path.move(to: description.item.position)
            path.addLine(to: point)
            description.path = path.cgPath
        } else {
            description.value = value
        }
        return AnimationMakerEditable(description: self.description)
    }
}
