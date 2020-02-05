//
//  EasingMakerSpec.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 2/5/20.
//  Copyright © 2020 Vladislav Kondrashkov. All rights reserved.
//

import Quick
import Nimble
@testable import Lotus

final class EasingMakerSpec: QuickSpec {
    override func spec() {
        var easingMaker: EasingMaker!

        beforeEach {
            easingMaker = EasingMaker()
        }

        describe("on make(:)") {
            it("should make range from start value to end value on custom easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .custom({ $0 * $0 }))

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }


            it("should make range from start value to end value on linear easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .linear)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on default in easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .defaultIn)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on default out easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .defaultOut)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on default in-out easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .defaultInOut)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on sine in easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .inSine)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on sine out easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .outSine)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on sine in-out easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .inOutSine)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on quad in easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .inQuad)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on quad out easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .outQuad)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on quad in-out easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .inOutQuad)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on cubic in easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .inCubic)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on cubic out easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .outCubic)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on cubic in-out easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .inOutCubic)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on quart in easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .inQuart)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on quart out easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .outQuart)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on quart in-out easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .inOutQuart)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on quint in easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .inQuint)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on quint out easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .outQuint)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue, within: 0.1))
            }

            it("should make range from start value to end value on quint in-out easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .inOutQuint)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on expo in easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .inExpo)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on expo out easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .outExpo)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue, within: 0.1))
            }

            it("should make range from start value to end value on expo in-out easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .inOutExpo)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue, within: 0.1))
            }

            it("should make range from start value to end value on circ in easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .inCirc)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on circ out easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .outCirc)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on circ in-out easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .inOutCirc)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on back in easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .inBack)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on back out easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .outBack)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }

            it("should make range from start value to end value on back in-out easing") {
                let startValue: CGFloat = 100
                let endValue: CGFloat = 150
                let values = easingMaker.make(fromValue: startValue, toValue: endValue, easingType: .inOutBack)

                expect(values.first).to(beCloseTo(startValue))
                expect(values.last).to(beCloseTo(endValue))
            }
        }
    }
}
