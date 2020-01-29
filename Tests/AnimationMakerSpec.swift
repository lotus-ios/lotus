//
//  AnimationMakerSpec.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 1/29/20.
//  Copyright © 2020 Vladislav Kondrashkov. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import Lotus

final class AnimationMakerSpec: QuickSpec {
    override func spec() {
        var maker: AnimationMakerAnimatable!
        var description: AnimationDescription!

        context("on vertical motion to(:)") {
            beforeEach {
                description = AnimationDescription(item: CALayer(), attribute: .verticalPosition)
                maker = AnimationMakerAnimatable(description: description)
            }

            it("should store float value as float") {
                let floatValue: Float = 0.3
                maker.to(floatValue)

                expect(description.toValue).to(beAnInstanceOf(CGFloat.self))
            }

            it("should store double value as float") {
                let doubleValue: Double = 0.3
                maker.to(doubleValue)

                expect(description.toValue).to(beAnInstanceOf(CGFloat.self))
            }

            it("should store int value as float") {
                let intValue: Int = 3
                maker.to(intValue)

                expect(description.toValue).to(beAnInstanceOf(CGFloat.self))
            }
        }

        context("on motion to(:)") {
            beforeEach {
                description = AnimationDescription(item: CALayer(), attribute: .position)
                maker = AnimationMakerAnimatable(description: description)
            }

            it("should store point as path") {
                let point = CGPoint(x: 0, y: 0)
                maker.to(point)

                expect(description.path).toNot(beNil())
            }
        }
    }
}
