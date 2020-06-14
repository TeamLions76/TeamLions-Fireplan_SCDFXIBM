//
//  FireTypeTests.swift
//  FireplanTests
//
//  Created by Hol Yin Ho on 14/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

import XCTest

class FireTypeTests: XCTestCase {
    let sampleFireJson: Any = [
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

    let invalidFireJson: Any = [
        "We" : "Love",
        "SCDF" : "!"
    ]

    func testInit_invalidJsonData() {
        let fireType = FireType(from: invalidFireJson)
        XCTAssertNil(fireType)
    }

    func testInit_validJsonData() {
        guard let fireType = FireType(from: sampleFireJson) else {
            XCTFail("Should be able to create valid fire type")
            return
        }
        XCTAssertEqual(fireType.fireType, "Textiles")
        XCTAssertEqual(fireType.fireClass, "A")
        let sampleLocations: [RoomType] = [.Kitchen, .Bedroom, .Utility]
        XCTAssertEqual(fireType.locations, sampleLocations)
        let sampleExtinguishingMethods =
            [
                "FoamExtinguisher",
                "WaterExtinguisher",
                "DryPowderExtinguisher"
            ]
        XCTAssertEqual(fireType.extinguishingMethods, sampleExtinguishingMethods)
    }
}
