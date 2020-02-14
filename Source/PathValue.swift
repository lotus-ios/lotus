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

        let id = CFGetTypeID(self as AnyObject)
        if id == CGPath.typeID {
            return self as! CGPath
        }

        assertionFailure("Post an issue to https://github.com/lotus-ios/lotus with code LFI-45")
        return CGPath(rect: .zero, transform: nil)
    }
}
