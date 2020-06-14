//
//  ToggleFloorSwitchTests.swift
//  FireplanTests
//
//  Created by Hol Yin Ho on 14/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

import XCTest

class ToggleFloorSwitchTests: XCTestCase {
    var toggleSwitch: ToggleFloorSwitch!

    override func setUp() {
        toggleSwitch = ToggleFloorSwitch(origin: CGPoint.zero)
    }

    func testInit() {
        XCTAssertTrue(toggleSwitch.isUserInteractionEnabled)
        let subviews = toggleSwitch.subviews.map { String(describing: type(of: $0)) }
        let uiLabelCount = subviews.filter { $0 == "UILabel" }.count
        XCTAssertEqual(subviews.count, 2)
        XCTAssertEqual(uiLabelCount, 2)
        XCTAssertEqual(toggleSwitch.selectedLevel, 1)
        XCTAssertNil(toggleSwitch.observer)
    }

    func testSelectLevel1_atLevel1() {
        let stubObserver = StubSwitchObserver()
        stubObserver.selectLevel1Expectation = expectation(description: "level 1")
        toggleSwitch.observer = stubObserver
        toggleSwitch.selectLevel1()
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(toggleSwitch.selectedLevel, 1)
    }

    func testSelectLevel2_atLevel1() {
        toggleSwitch.selectLevel1()
        let stubObserver = StubSwitchObserver()
        stubObserver.selectLevel2Expectation = expectation(description: "level 2")
        toggleSwitch.observer = stubObserver
        toggleSwitch.selectLevel2()
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(toggleSwitch.selectedLevel, 2)
    }

    func testSelectLevel1_atLevel2() {
        toggleSwitch.selectLevel2()
        let stubObserver = StubSwitchObserver()
        stubObserver.selectLevel1Expectation = expectation(description: "level 1")
        toggleSwitch.observer = stubObserver
        toggleSwitch.selectLevel1()
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(toggleSwitch.selectedLevel, 1)
    }

    func testSelectLevel2_atLevel2() {
        toggleSwitch.selectLevel2()
        let stubObserver = StubSwitchObserver()
        stubObserver.selectLevel2Expectation = expectation(description: "level 2")
        toggleSwitch.observer = stubObserver
        toggleSwitch.selectLevel2()
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(toggleSwitch.selectedLevel, 2)
    }
}

class StubSwitchObserver: SwitchObserver {
    var selectLevel1Expectation: XCTestExpectation?
    var selectLevel2Expectation: XCTestExpectation?
    func didSelectLevel1() {
        selectLevel1Expectation?.fulfill()
    }

    func didSelectLevel2() {
        selectLevel2Expectation?.fulfill()
    }
}
