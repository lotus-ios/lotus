//
//  UIView+AnimationLayer.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

public extension UIView {
    var lotus: AnimationLayerDSL {
        return self.layer.lotus
    }
}
