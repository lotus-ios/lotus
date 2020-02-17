//
//  AnimationValueSpec.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 2/14/20.
//  Copyright © 2020 Vladislav Kondrashkov. All rights reserved.
//

import Quick
import Nimble
@testable import Lotus

final class AnimationValueSpec: QuickSpec {
    override func spec() {
        describe("on animationValueFor(:)") {
            var animationValue: AnimationValue!

            beforeEach {
                animationValue = 0
            }

            context("with Int") {
                animationValue = Int(3)
                it("should return CGFloat") {
                    let result = animationValue.animationValueFor(animationAttribute: .heightScale)
                    expect(result).to(beCloseTo(3))
                }
            }

            context("with UInt") {
                animationValue = UInt(3)
                it("should return CGFloat") {
                    let result = animationValue.animationValueFor(animationAttribute: .heightScale)
                    expect(result).to(beCloseTo(3))
                }
            }

            context("with Float") {
                animationValue = Float(0.3)
                it("should return CGFloat") {
                    let result = animationValue.animationValueFor(animationAttribute: .heightScale)
                    expect(result).to(beCloseTo(0.3))
                }
            }

            context("with Double") {
                animationValue = Double(0.3)
                it("should return CGFloat") {
                    let result = animationValue.animationValueFor(animationAttribute: .heightScale)
                    expect(result).to(beCloseTo(0.3))
                }
            }

            context("with CGFloat") {
                animationValue = CGFloat(0.3)
                it("should return CGFloat") {
                    let result = animationValue.animationValueFor(animationAttribute: .heightScale)
                    expect(result).to(beCloseTo(0.3))
                }
            }

            context("with CGSize and heightScale") {
                animationValue = CGSize(width: 0.3, height: 0.4)
                it("should return CGFloat for height") {
                    let result = animationValue.animationValueFor(animationAttribute: .heightScale)
                    expect(result).to(beCloseTo(0.4))
                }
            }

            context("with CGSize and widthScale") {
                animationValue = CGSize(width: 0.3, height: 0.4)
                it("should return CGFloat for width") {
                    let result = animationValue.animationValueFor(animationAttribute: .widthScale)
                    expect(result).to(beCloseTo(0.3))
                }
            }
        }
    }
}
