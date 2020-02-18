//
//  PathValue.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 2/14/20.
//  Copyright © 2020 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

public protocol PathValue {}

extension UIBezierPath: PathValue {}

extension CGPath: PathValue {}

extension PathValue {
    func pathValue() -> CGPath {
        if let path = self as? UIBezierPath {
            return path.cgPath
        }

        /// Self cannot be optional casted to CGFloat
        /// CoreGraphics requires to check CFTypeId equality
        let id = CFGetTypeID(self as AnyObject)
        if id == CGPath.typeID {
            return self as! CGPath
        }

        assertionFailure("Failed to cast PathValue to CGPath")
        return CGPath(rect: .zero, transform: nil)
    }
}
