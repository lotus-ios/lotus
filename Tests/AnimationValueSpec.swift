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
                it("should return CGFloat") {
                    animationValue = Int(3)
                    let result = animationValue.animationValueFor(animationAttribute: .heightScale)
                    expect(result).to(beCloseTo(3))
                }
            }

            context("with UInt") {
                it("should return CGFloat") {
                    animationValue = UInt(3)
                    let result = animationValue.animationValueFor(animationAttribute: .heightScale)
                    expect(result).to(beCloseTo(3))
                }
            }

            context("with Float") {
                it("should return CGFloat") {
                    animationValue = Float(0.3)
                    let result = animationValue.animationValueFor(animationAttribute: .heightScale)
                    expect(result).to(beCloseTo(0.3))
                }
            }

            context("with Double") {
                it("should return CGFloat") {
                    animationValue = Double(0.3)
                    let result = animationValue.animationValueFor(animationAttribute: .heightScale)
                    expect(result).to(beCloseTo(0.3))
                }
            }

            context("with CGFloat") {
                it("should return CGFloat") {
                    animationValue = CGFloat(0.3)
                    let result = animationValue.animationValueFor(animationAttribute: .heightScale)
                    expect(result).to(beCloseTo(0.3))
                }
            }

            context("with CGSize and heightScale") {
                it("should return CGFloat for height") {
                    animationValue = CGSize(width: 0.3, height: 0.4)
                    let result = animationValue.animationValueFor(animationAttribute: .heightScale)
                    expect(result).to(beCloseTo(0.4))
                }
            }

            context("with CGSize and widthScale") {
                it("should return CGFloat for width") {
                    animationValue = CGSize(width: 0.3, height: 0.4)
                    let result = animationValue.animationValueFor(animationAttribute: .widthScale)
                    expect(result).to(beCloseTo(0.3))
                }
            }
        }
    }
}
