//
//  AnimationResultSpec.swift
//  LotusTests
//
//  Created by Vladislav Kondrashkov on 8/15/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import Lotus

final class AnimationResultSpec: QuickSpec {
    override func spec() {
        var window: UIWindow!
        var layer: CALayer!
        let layerFrame = CGRect(
            x: 50.0,
            y: 50.0,
            width: 100.0,
            height: 100.0
        )

        var item: AnimatableItem {
            return layer
        }

        beforeEach {
            layer = CALayer()
            layer.frame = layerFrame

            let viewController = UIViewController()
            viewController.view.layer.addSublayer(layer)

            window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = viewController
            window.makeKeyAndVisible()
        }

        context("running Lotus'") {

            // MARK: - Motion animation

            it("motion animation should change position") {
                layer.lotus.runAnimation {
                    $0.motion.to(CGPoint(x: 15.0, y: 25.0)).during(0.01)
                }

                waitUntil(timeout: 0.5) { done in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                        expect(item.position.x).to(beCloseTo(15.0, within: 0.01))
                        expect(item.position.y).to(beCloseTo(25.0, within: 0.01))
                        done()
                    }
                }
            }

            it("horizontal motion animation") {
                layer.lotus.runAnimation {
                    $0.motion(.horizontal).to(30.0).during(0.01)
                }

                waitUntil(timeout: 0.5) { done in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                        expect(item.position.x).to(beCloseTo(30.0))
                        done()
                    }
                }
            }

            it("vertical motion animation") {
                layer.lotus.runAnimation {
                    $0.motion(.vertical).to(27.03).during(0.01)
                }

                waitUntil(timeout: 0.5) { done in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                        expect(item.position.y).to(beCloseTo(27.03))
                        done()
                    }
                }
            }

            // MARK: - Scaling animation

            it("scaling animation") {
                layer.lotus.runAnimation {
                    $0.scaling.to(2.3).during(0.01)
                }

                waitUntil(timeout: 0.5) { done in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                        expect(item.scale).to(beCloseTo(2.3))
                        done()
                    }
                }
            }

            it("width scaling animation") {
                layer.lotus.runAnimation {
                    $0.scaling(.width).to(1.23).during(0.01)
                }

                waitUntil(timeout: 0.5) { done in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                        expect(item.scaleX).to(beCloseTo(1.23))
                        done()
                    }
                }
            }

            it("height scaling animation") {
                layer.lotus.runAnimation {
                    $0.scaling(.height).to(2.03).during(0.01)
                }

                waitUntil(timeout: 0.5) { done in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                        expect(item.scaleY).to(beCloseTo(2.03))
                        done()
                    }
                }
            }

            // MARK: - Rotation animation

            it("full rotation animation") {
                layer.lotus.runAnimation {
                    $0.rotation.to(2.0 * .pi).during(0.01)
                }

                waitUntil(timeout: 0.5) { done in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                        expect(item.rotation).to(beCloseTo(0.0))
                        done()
                    }
                }
            }

            it("angle rotation animation") {
                layer.lotus.runAnimation {
                    $0.rotation.to(23.7 * .pi / 180.0).during(0.01)
                }

                waitUntil(timeout: 0.5) { done in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                        expect(item.rotation).to(beCloseTo(23.7 * .pi / 180.0))
                        done()
                    }
                }
            }

            // MARK: - Opacity tests

            it("opacity animation") {
                layer.lotus.runAnimation {
                    $0.opacity.to(0.7).during(0.01)
                }

                waitUntil(timeout: 0.5) { done in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                        expect(item.alpha).to(beCloseTo(0.7, within: 0.01))
                        done()
                    }
                }
            }
        }
    }
}
