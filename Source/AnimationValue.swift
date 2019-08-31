//
//  AnimationValue.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

public protocol AnimationValue { }

extension Int: AnimationValue { }

extension UInt: AnimationValue { }

extension Float: AnimationValue { }

extension Double: AnimationValue { }

extension CGFloat: AnimationValue { }

extension CGSize: AnimationValue { }

extension CGPoint: AnimationValue { }
