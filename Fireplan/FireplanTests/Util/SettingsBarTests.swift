//
//  SettingsBarTests.swift
//  FireplanTests
//
//  Created by Hol Yin Ho on 14/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

import XCTest

class SettingsBarTests: XCTestCase {
    func testInit() {
        let settingsBar =
            SettingsBar(origin: CGPoint.zero, image: UIImage(), title: "test", desc: "test test")

        XCTAssertEqual(settingsBar.layer.borderWidth, 2)
        XCTAssertEqual(settingsBar.layer.borderColor, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        let subviews = settingsBar.subviews.map { String(describing: type(of: $0)) }
        let uiLabelCount = subviews.filter { $0 == "UILabel" }.count
        XCTAssertEqual(subviews.count, 3)
        XCTAssertTrue(subviews.contains("UIImageView"))
        XCTAssertTrue(subviews.contains("UILabel"))
        XCTAssertEqual(uiLabelCount, 2)

        XCTAssertEqual(
            settingsBar.frame,
            CGRect(
                origin: CGPoint.zero,
                size: CGSize(width: UIScreen.main.bounds.width - 40, height: 50)))
    }
}
