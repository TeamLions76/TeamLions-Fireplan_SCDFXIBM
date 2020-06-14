//
//  InfoWindowTests.swift
//  FireplanTests
//
//  Created by Hol Yin Ho on 14/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

import XCTest

class InfoWindowTests: XCTestCase {
    let textileFireJson: Any = [
        "fireType": "Textiles",
        "class": "A",
        "location": [
            "Kitchen",
            "Bedroom",
            "Utility"
        ],
        "extinguish": [
            "FoamExtinguisher",
            "WaterExtinguisher",
            "DryPowderExtinguisher"
        ]
    ]
    let randomFireJson: Any = [
        "fireType": "random",
        "class": "AAA",
        "location": [
            "Bedroom",
            "Utility"
        ],
        "extinguish": [
            "FoamExtinguisher",
            "DryPowderExtinguisher"
        ]
    ]
    func testInit_existingPotentialFireTypes() {
        let myRoom = Room(
            roomName: "myRoom",
            roomType: .Bedroom, level: 1,
            frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 5, height: 5)))
        guard let textileFireType = FireType(from: textileFireJson) else {
            XCTFail("Should be able to create valid fire type")
            return
        }
        guard let randomFire = FireType(from: randomFireJson) else {
            XCTFail("Should be able to create valid fire type")
            return
        }
        let infoWindow = InfoWindow(room: myRoom, potentialFireTypes: [textileFireType, randomFire])
        XCTAssertEqual(infoWindow.backgroundColor, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        XCTAssertEqual(infoWindow.layer.cornerRadius, 10)
        XCTAssertTrue(abs(infoWindow.alpha - 0.95) < 0.1)
        let subviews = infoWindow.subviews.map { String(describing: type(of: $0)) }
        let uiLabelCount = subviews.filter { $0 == "UILabel" }.count
        XCTAssertEqual(uiLabelCount, 11)
        XCTAssertEqual(infoWindow.okButton.text, "OK")
        XCTAssertEqual(infoWindow.okButton.textAlignment, .right)
        XCTAssertTrue(infoWindow.okButton.isUserInteractionEnabled)
        XCTAssertEqual(infoWindow.okButton.font, UIFont.boldSystemFont(ofSize: 20.0))
    }

    func testInit_noExistingPotentialFireTypes() {
        let myRoom = Room(
            roomName: "myRoom",
            roomType: .Bedroom, level: 1,
            frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 5, height: 5)))
        let infoWindow = InfoWindow(room: myRoom, potentialFireTypes: [])
        XCTAssertEqual(infoWindow.backgroundColor, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        XCTAssertEqual(infoWindow.layer.cornerRadius, 10)
        XCTAssertTrue(abs(infoWindow.alpha - 0.95) < 0.1)
        let subviews = infoWindow.subviews.map { String(describing: type(of: $0)) }
        let uiLabelCount = subviews.filter { $0 == "UILabel" }.count
        XCTAssertEqual(uiLabelCount, 10)
        XCTAssertEqual(infoWindow.okButton.text, "OK")
        XCTAssertEqual(infoWindow.okButton.textAlignment, .right)
        XCTAssertTrue(infoWindow.okButton.isUserInteractionEnabled)
        XCTAssertEqual(infoWindow.okButton.font, UIFont.boldSystemFont(ofSize: 20.0))
    }
}
