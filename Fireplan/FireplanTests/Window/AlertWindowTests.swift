//
//  AlertWindowTests.swift
//  FireplanTests
//
//  Created by Hol Yin Ho on 14/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

import XCTest

class AlertWindowTests: XCTestCase {
    func testInit_isNotEvacuate() {
        let alertWindow = AlertWindow(text: "test test", image: UIImage(), isEvacuate: false)

        XCTAssertEqual(alertWindow.backgroundColor, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        XCTAssertTrue(abs(alertWindow.alpha - 0.95) < 0.1)
        XCTAssertTrue(alertWindow.clipsToBounds)
        XCTAssertEqual(alertWindow.layer.cornerRadius, 10)

        let subviews = alertWindow.subviews.map { String(describing: type(of: $0)) }
        let uiLabelCount = subviews.filter { $0 == "UILabel" }.count
        XCTAssertEqual(subviews.count, 3)
        XCTAssertEqual(uiLabelCount, 2)
    }

    func testInit_isEvacuate() {
        let alertWindow = AlertWindow(text: "test test", image: UIImage(), isEvacuate: true)

        XCTAssertEqual(alertWindow.backgroundColor, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        XCTAssertTrue(abs(alertWindow.alpha - 0.95) < 0.1)
        XCTAssertTrue(alertWindow.clipsToBounds)
        XCTAssertEqual(alertWindow.layer.cornerRadius, 10)

        let subviews = alertWindow.subviews.map { String(describing: type(of: $0)) }
        let uiLabelCount = subviews.filter { $0 == "UILabel" }.count
        XCTAssertEqual(subviews.count, 4)
        XCTAssertEqual(uiLabelCount, 3)

    }
}
