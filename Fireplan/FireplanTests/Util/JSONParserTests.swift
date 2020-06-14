//
//  JSONParserTests.swift
//  FireplanTests
//
//  Created by Hol Yin Ho on 14/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

import XCTest

class JSONParserTests: XCTestCase {
    let jsonObject : Any = [
        "key1" : "value1",
        "key2" : "value2",
        "key3" : [
            "sub1",
            "sub2",
            "sub3"
        ]
    ]

    func testGetObject_keyDoesNotExist() {
        let result = JSONParser.getObject(from: jsonObject, key: "key4")
        XCTAssertNil(result)
    }

    func testGetObject_keyExists() {
        let result = JSONParser.getObject(from: jsonObject, key: "key2")
        XCTAssertEqual(result as? String, "value2")
    }

    func testGetArray_keyDoesNotExist() {
        let result = JSONParser.getArray(from: jsonObject, key: "key4")
        XCTAssertNil(result)
    }

    func testGetArray_keyExists() {
        let result = JSONParser.getArray(from: jsonObject, key: "key3")
        XCTAssertEqual(result as? [String], ["sub1", "sub2", "sub3"])
    }
}
