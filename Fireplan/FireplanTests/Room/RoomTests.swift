//
//  RoomTests.swift
//  FireplanTests
//
//  Created by Hol Yin Ho on 14/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

import XCTest

class RoomTests: XCTestCase {
    func testInit_withRoomName() {
        let bedroomOrigin = CGPoint(x: 135, y: 60)
        let bedroomSize = CGSize(width:  200, height: 120)
        let bedroom = Room(
            roomName: "Bed",
            roomType: .Bedroom,
            level: 2,
            frame: CGRect(origin: bedroomOrigin, size: bedroomSize))

        XCTAssertEqual(bedroom.roomName, "Bed")
        XCTAssertEqual(bedroom.roomType, .Bedroom)
        XCTAssertNil(bedroom.observer)
        XCTAssertEqual(bedroom.level, 2)
        XCTAssertNil(bedroom.fireSize)
        XCTAssertNotNil(bedroom.sensor)
        XCTAssertNil(bedroom.layer.backgroundColor)
    }

    func testInit_noRoomName() {
        let bedroomOrigin = CGPoint(x: 135, y: 60)
        let bedroomSize = CGSize(width:  200, height: 120)
        let bedroom = Room(
            roomName: "",
            roomType: .Bedroom,
            level: 2,
            frame: CGRect(origin: bedroomOrigin, size: bedroomSize))

        XCTAssertEqual(bedroom.roomName, "")
        XCTAssertEqual(bedroom.roomType, .Bedroom)
        XCTAssertNil(bedroom.observer)
        XCTAssertEqual(bedroom.level, 2)
        XCTAssertNil(bedroom.fireSize)
        XCTAssertNil(bedroom.sensor)
        XCTAssertNil(bedroom.layer.backgroundColor)
    }

    func testFireWasDetected() {
        let bedroomOrigin = CGPoint(x: 135, y: 60)
        let bedroomSize = CGSize(width:  200, height: 120)
        let bedroom = Room(
            roomName: "Bed",
            roomType: .Bedroom,
            level: 2,
            frame: CGRect(origin: bedroomOrigin, size: bedroomSize))

        let stubObserver = StubRoomObserver()
        stubObserver.setFireExpectation = expectation(description: "set fire")
        bedroom.observer = stubObserver

        bedroom.fireWasDetected(fireSize: .large)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(bedroom.fireSize, .large)
    }

    func testStopFire() {
        let bedroomOrigin = CGPoint(x: 135, y: 60)
        let bedroomSize = CGSize(width:  200, height: 120)
        let bedroom = Room(
            roomName: "Bed",
            roomType: .Bedroom,
            level: 2,
            frame: CGRect(origin: bedroomOrigin, size: bedroomSize))

        bedroom.stopFire()
        XCTAssertNil(bedroom.fireSize)
        XCTAssertNil(bedroom.layer.backgroundColor)
    }

    func testDetectFire_thenStopFire() {
        let bedroomOrigin = CGPoint(x: 135, y: 60)
        let bedroomSize = CGSize(width:  200, height: 120)
        let bedroom = Room(
            roomName: "Bed",
            roomType: .Bedroom,
            level: 2,
            frame: CGRect(origin: bedroomOrigin, size: bedroomSize))

        let stubObserver = StubRoomObserver()
        stubObserver.setFireExpectation = expectation(description: "set fire")
        bedroom.observer = stubObserver

        bedroom.fireWasDetected(fireSize: .large)
        waitForExpectations(timeout: 5, handler: nil)
        bedroom.stopFire()

        XCTAssertNil(bedroom.fireSize)
        XCTAssertNil(bedroom.layer.backgroundColor)
    }
}

class StubRoomObserver: RoomObserver {
    var setFireExpectation: XCTestExpectation?

    func roomDidSetOnFire(room: Room) {
        setFireExpectation?.fulfill()
    }

    func roomIsTapped(room: Room) {
    }
}
