//
//  FloorPlanViewControllerTests.swift
//  FireplanTests
//
//  Created by Hol Yin Ho on 14/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

import XCTest

class FloorPlanViewControllerTests: XCTestCase {
    var viewController: FloorPlanViewController!

    override func setUp() {
        viewController = FloorPlanViewController()
    }

    func testViewDidLoad() {
        viewController.viewDidLoad()
        let subviews = viewController.view.subviews.map { String(describing: type(of: $0)) }
        let uiLabelCount = subviews.filter { $0 == "UILabel" }.count
        let floorPlanCount = subviews.filter { $0 == "FloorPlan" }.count
        let buttonCount = subviews.filter { $0 == "UIButton" }.count
        let switchCount = subviews.filter { $0 == "ToggleFloorSwitch" }.count
        print(subviews)
        XCTAssertEqual(uiLabelCount, 1)
        XCTAssertEqual(floorPlanCount, 2)
        XCTAssertEqual(buttonCount, 1)
        XCTAssertEqual(switchCount, 2)
        XCTAssertNil(viewController.currentlyOpenedInfoWindow)
    }

    func testSetUpRooms() {
        viewController.rooms.forEach {
            XCTAssertNil($0.observer)
        }
        viewController.setUpRooms()
        viewController.rooms.forEach {
            XCTAssertNotNil($0.observer)
        }
    }

    func testDidSelectLevel1() {
        viewController.viewDidLoad()
        viewController.didSelectLevel1()

        assertInLevel(level: 1)
}

    func testDidSelectLevel2() {
        viewController.viewDidLoad()
        viewController.didSelectLevel2()

        assertInLevel(level: 2)
    }

    func testRoomDidSetOnFire() {
        viewController.viewDidLoad()
        viewController.didSelectLevel2()
        assertInLevel(level: 2)
        let myRoom = Room(
            roomName: "myRoom",
            roomType: .Bedroom, level: 1,
            frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 5, height: 5)))
        viewController.viewDidLoad()
        let originalSubViewCount = viewController.view.subviews.map { String(describing: type(of: $0)) }.count
        viewController.roomDidSetOnFire(room: myRoom)
        let afterSubViewCount = viewController.view.subviews.map { String(describing: type(of: $0)) }.count

        assertInLevel(level: 1)
        XCTAssertEqual(originalSubViewCount + 1, afterSubViewCount)
    }

    func testRoomIsTapped() {
        viewController.viewDidLoad()
        XCTAssertNil(viewController.currentlyOpenedInfoWindow)
        let myRoom = Room(
            roomName: "myRoom",
            roomType: .Bedroom, level: 1,
            frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 5, height: 5)))
        let originalSubViewCount = viewController.view.subviews.map { String(describing: type(of: $0)) }.count
        viewController.roomIsTapped(room: myRoom)
        let afterSubViewCount = viewController.view.subviews.map { String(describing: type(of: $0)) }.count

        XCTAssertEqual(originalSubViewCount + 1, afterSubViewCount)
        XCTAssertNotNil(viewController.currentlyOpenedInfoWindow)
    }
}

extension FloorPlanViewControllerTests {
    func assertInLevel(level: Int) {
        let noOfRoomsInLevel1 = viewController.floorPlan1.subviews.count
        let noOfRoomsInLevel2 = viewController.floorPlan2.subviews.count
        if level == 1 {
            XCTAssertEqual(viewController.selectedFloorPlan.subviews.count, noOfRoomsInLevel1)
        }
        if level == 2 {
            XCTAssertEqual(viewController.selectedFloorPlan.subviews.count, noOfRoomsInLevel2)
        }
    }
}
