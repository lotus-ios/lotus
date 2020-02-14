//
//  PathValueSpec.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 2/14/20.
//  Copyright © 2020 Vladislav Kondrashkov. All rights reserved.
//

import Quick
import Nimble
@testable import Lotus

final class PathValueSpec: QuickSpec {
    override func spec() {
        describe("on pathValue()") {
            var pathValue: PathValue!

            beforeEach {
                pathValue = UIBezierPath()
            }

            it("should return path with same bounding box when bezier path given") {
                let boundingBox = CGRect(x: 12, y: 84, width: 23, height: 46)
                let bezierPath = UIBezierPath()
                bezierPath.move(to: boundingBox.origin)
                let destinationPoint = CGPoint(
                    x: boundingBox.origin.x + boundingBox.width,
                    y: boundingBox.origin.y + boundingBox.height
                )
                bezierPath.addLine(to: destinationPoint)

                pathValue = bezierPath

                let result = pathValue.pathValue()
                expect(result.boundingBoxOfPath).to(equal(boundingBox))
            }

            it("should return path with same bounding box when path given") {
                let boundingBox = CGRect(x: 50, y: 12, width: 15, height: 100)
                let path = CGPath(rect: boundingBox, transform: nil)

                pathValue = path

                let result = pathValue.pathValue()
                expect(result.boundingBox).to(equal(boundingBox))
            }
        }
    }
}
