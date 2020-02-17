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

        describe("on runAnimation(:)") {

            // MARK: - Motion animations

            context("when motion animation completed") {
                beforeEach {
                    layer.lotus.runAnimation {
                        $0.motion.to(CGPoint(x: 15, y: 25)).during(0.01)
                    }
                }

                it("should change layer's X position") {
                    expect(item.position.x).toEventually(beCloseTo(15.0, within: 0.01))
                }

                it("should change layer's Y position") {
                    expect(item.position.y).toEventually(beCloseTo(25.0, within: 0.01))
                }
            }

            context("when motion animation along path completed") {
                beforeEach {
                    let path = UIBezierPath()
                    path.move(to: layer.position)
                    path.addLine(to: CGPoint(x: 45, y: 50))
                    path.addLine(to: CGPoint(x: 65, y: 63))
                    layer.lotus.runAnimation {
                        $0.motion.along(path).during(0.01)
                    }
                }

                it("should change layer's X position") {
                    expect(item.position.x).toEventually(beCloseTo(65, within: 0.01))
                }

                it("should change layer's Y position") {
                    expect(item.position.y).toEventually(beCloseTo(63, within: 0.01))
                }
            }

            context("when horizontal motion animation completed") {
                beforeEach {
                    layer.lotus.runAnimation {
                        $0.motion(.horizontal).to(30).during(0.01)
                    }
                }

                it("should change layer's X position") {
                    expect(item.position.x).toEventually(beCloseTo(30.0))
                }
            }

            context("when vertical motion animation completed") {
                beforeEach {
                    layer.lotus.runAnimation {
                        $0.motion(.vertical).to(27.03).during(0.01)
                    }
                }

                it("should change layer's Y position") {
                    expect(item.position.y).toEventually(beCloseTo(27.03))
                }
            }

            // MARK: - Scaling animations

            context("when scaling animation completed") {
                beforeEach {
                    layer.lotus.runAnimation {
                        $0.scaling.to(2.3).during(0.01)
                    }
                }

                it("should change layer's scale") {
                    expect(item.scale).toEventually(beCloseTo(2.3))
                }
            }

            context("when width scaling animation completed") {
                beforeEach {
                    layer.lotus.runAnimation {
                        $0.scaling(.width).to(1.23).during(0.01)
                    }
                }

                it("should change layer's width scale") {
                    expect(item.scaleX).toEventually(beCloseTo(1.23))
                }
            }

            context("when height scaling animation completed") {
                beforeEach {
                    layer.lotus.runAnimation {
                        $0.scaling(.height).to(2.03).during(0.01)
                    }
                }

                it("should change layer's height scale") {
                    expect(item.scaleY).toEventually(beCloseTo(2.03))
                }
            }

            // MARK: - Rotation animations

            context("when full rotation animation completed") {
                beforeEach {
                    layer.lotus.runAnimation {
                        $0.rotation.to(2.0 * .pi).during(0.01)
                    }
                }

                it("shouldn't change layer's rotation") {
                    expect(item.rotation).toEventually(beCloseTo(0.0))
                }
            }

            context("when angle rotation animation completed") {
                beforeEach {
                    layer.lotus.runAnimation {
                        $0.rotation.to(23.7 * .pi / 180.0).during(0.01)
                    }
                }

                it("should change layer's rotation") {
                    expect(item.rotation).toEventually(beCloseTo(23.7 * .pi / 180.0))
                }
            }

            // MARK: - Opacity animations

            context("when opacity animation completed") {
                beforeEach {
                    layer.lotus.runAnimation {
                        $0.opacity.to(0.7).during(0.01)
                    }
                }

                it("should change layer's transparency") {
                    expect(item.alpha).toEventually(beCloseTo(0.7, within: 0.01))
                }
            }
        }
    }
}
