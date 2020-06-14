//
//  FloorPlanTests.swift
//  FireplanTests
//
//  Created by Hol Yin Ho on 14/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

import XCTest

class FloorPlanTests: XCTestCase {
    func testInit() {
        let floorPlanRect =  CGRect(origin: CGPoint.zero, size: CGSize(width: 40, height: 50))
        let floorPlan = FloorPlan(frame: floorPlanRect)

        XCTAssertEqual(floorPlan.backgroundColor, FloorPlan.backgroundColor)
        XCTAssertEqual(floorPlan.frame, floorPlanRect)
    }
}
