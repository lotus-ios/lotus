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

            it("should return float value when int given") {
                animationValue = Int(3)

                let result = animationValue.animationValueFor(animationAttribute: .heightScale)
                expect(result).to(beCloseTo(3))
            }

            it("should return float value when unsigned int given") {
                animationValue = UInt(3)

                let result = animationValue.animationValueFor(animationAttribute: .heightScale)
                expect(result).to(beCloseTo(3))
            }

            it("should return float value when float given") {
                animationValue = Float(0.3)

                let result = animationValue.animationValueFor(animationAttribute: .heightScale)
                expect(result).to(beCloseTo(0.3))
            }

            it("should return float value when double given") {
                animationValue = Double(0.3)

                let result = animationValue.animationValueFor(animationAttribute: .heightScale)
                expect(result).to(beCloseTo(0.3))
            }

            it("should return float value when float given") {
                animationValue = CGFloat(0.3)

                let result = animationValue.animationValueFor(animationAttribute: .heightScale)
                expect(result).to(beCloseTo(0.3))
            }

            it("should return float value for height when size given on height scale") {
                animationValue = CGSize(width: 0.3, height: 0.4)

                let result = animationValue.animationValueFor(animationAttribute: .heightScale)
                expect(result).to(beCloseTo(0.4))
            }

            it("should return float value for height when size given on width scale") {
                animationValue = CGSize(width: 0.3, height: 0.4)

                let result = animationValue.animationValueFor(animationAttribute: .widthScale)
                expect(result).to(beCloseTo(0.3))
            }
        }
    }
}
