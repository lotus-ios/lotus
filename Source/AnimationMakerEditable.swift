//
//  AnimationMakerEditable.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

public final class AnimationMakerEditable {
    let description: AnimationDescription

    init(description: AnimationDescription) {
        self.description = description
    }

    @discardableResult
    public func during(_ value: AnimationValue) -> AnimationMakerEditable {
        description.duration = value
        return self
    }

    @discardableResult
    public func delay(_ value: AnimationValue) -> AnimationMakerEditable {
        description.delay = value
        return self
    }
}
