//
//  AnimationAttribute.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

enum AnimationAttribute: String {
    case position
    case horizontalPosition = "position.x"
    case verticalPosition = "position.y"
    case scale = "transform.scale"
    case widthScale = "transform.scale.x"
    case heightScale = "transform.scale.y"
    case opacity
    case rotation = "transform.rotation"
}
