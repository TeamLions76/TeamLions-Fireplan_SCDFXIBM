//
//  AlertInfoWindowTests.swift
//  FireplanTests
//
//  Created by Hol Yin Ho on 14/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

import XCTest

class AlertInfoWindowTests: XCTestCase {
    func testInit_isSendLocation_false() {
        let alertInfoWindow = AlertInfoWindow(isSendLocation: false)

        XCTAssertEqual(alertInfoWindow.backgroundColor, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        XCTAssertEqual(alertInfoWindow.layer.cornerRadius, 10)
        XCTAssertTrue(abs(alertInfoWindow.alpha - 0.95) < 0.1)

        let subviews = alertInfoWindow.subviews.map { String(describing: type(of: $0)) }
        let uiLabelCount = subviews.filter { $0 == "UILabel" }.count
        XCTAssertEqual(subviews.count, 2)
        XCTAssertEqual(uiLabelCount, 2)

        XCTAssertEqual(alertInfoWindow.okButton.text, "OK")
        XCTAssertEqual(alertInfoWindow.okButton.textAlignment, .right)
        XCTAssertTrue(alertInfoWindow.okButton.isUserInteractionEnabled)
        XCTAssertEqual(alertInfoWindow.okButton.font, UIFont.boldSystemFont(ofSize: 20.0))
    }

    func testInit_isSendLocation_true() {
        let alertInfoWindow = AlertInfoWindow(isSendLocation: true)

        XCTAssertEqual(alertInfoWindow.backgroundColor, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        XCTAssertEqual(alertInfoWindow.layer.cornerRadius, 10)
        XCTAssertTrue(abs(alertInfoWindow.alpha - 0.95) < 0.1)

        let subviews = alertInfoWindow.subviews.map { String(describing: type(of: $0)) }
        let uiLabelCount = subviews.filter { $0 == "UILabel" }.count
        XCTAssertEqual(subviews.count, 3)
        XCTAssertEqual(uiLabelCount, 3)

        XCTAssertEqual(alertInfoWindow.okButton.text, "OK")
        XCTAssertEqual(alertInfoWindow.okButton.textAlignment, .right)
        XCTAssertTrue(alertInfoWindow.okButton.isUserInteractionEnabled)
        XCTAssertEqual(alertInfoWindow.okButton.font, UIFont.boldSystemFont(ofSize: 20.0))
    }
}
