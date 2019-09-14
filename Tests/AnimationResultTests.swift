//
//  AnimationResultTests.swift
//  LotusTests
//
//  Created by Vladislav Kondrashkov on 8/15/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import XCTest
@testable import Lotus

final class AnimationResultTests: XCTestCase {
    private let layerSize = CGSize(width: 100.0, height: 100.0)
    private var layer: CALayer!
    private var item: AnimatableItem {
        return layer
    }
    private var container: UIView!

    override func setUp() {
        container = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 2 * layerSize.width,
                height: 2 * layerSize.height
            )
        )

        layer = CALayer()
        layer.frame = CGRect(
            x: layerSize.width / 2.0,
            y: layerSize.height / 2.0,
            width: layerSize.width,
            height: layerSize.height
        )
        container.layer.addSublayer(layer)
    }

    // MARK: - Motion tests

    func testRunMotionAnimation() {
        layer.lotus.runAnimation {
            $0.motion.to(CGPoint(x: 10.0, y: 10.0))
        }

        XCTAssertEqual(item.position, CGPoint(x: 10.0, y: 10.0), "Position should be changed after motion animation.")
    }

    func testRunHorizontalMotionAnimation() {
        layer.lotus.runAnimation {
            $0.motion(.horizontal).to(10.0)
        }

        XCTAssertEqual(item.position.y, 10.0, "Position should be changed after motion animation.")
    }

    func testRunVerticalMotionAnimation() {
        layer.lotus.runAnimation {
            $0.motion(.vertical).to(10.0)
        }

        XCTAssertEqual(item.position.y, 10.0, "Position should be changed after motion animation.")
    }

    // MARK: - Scale tests

    func testRunScalingAnimation() {
        layer.lotus.runAnimation {
            $0.scaling.to(2.0)
        }

        XCTAssertEqual(item.scale, 2.0, "Scale should be changed after scaling animation.")
    }

    func testRunWidthScalingAnimation() {
        layer.lotus.runAnimation {
            $0.scaling(.width).to(2.0)
        }

        XCTAssertEqual(item.scaleX, 2.0, "Scale should be changed after scaling animation.")
    }

    func testRunHeightScalingAnimation() {
        layer.lotus.runAnimation {
            $0.scaling(.height).to(2.0)
        }

        XCTAssertEqual(item.scaleY, 2.0, "Scale should be changed after scaling animation.")
    }

    // MARK: - Rotation tests

    func testRunRotationAnimation() {
        layer.lotus.runAnimation {
            $0.rotation.to(2.0 * .pi)
        }

        XCTAssertEqual(item.rotation, 2.0 * .pi, "Rotation should be changed after rotation animation.")
    }

    // MARK: - Opacity tests

    func testRunOpacityAnimation() {
        layer.lotus.runAnimation {
            $0.opacity.to(0.5)
        }

        XCTAssertEqual(item.alpha, 0.5, "Opacity should be changed after opacity animation.")
    }
}
