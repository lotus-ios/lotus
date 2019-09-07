//
//  AnimatableItem.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

public protocol AnimatableItem: AnyObject {
    var position: CGPoint { get }
}

extension CALayer: AnimatableItem { }
