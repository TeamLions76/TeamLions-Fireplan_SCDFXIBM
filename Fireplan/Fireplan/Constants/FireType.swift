//
//  FireType.swift
//  Fireplan
//
//  Created by Hol Yin Ho on 13/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

class FireType {
    let fireClass: String
    let extinguishingMethods: [String]
    let fireType: String
    let locations: [RoomType]

    init?(from jsonData: Any) {
        guard let currentFireClass = JSONParser.getObject(from: jsonData, key: "class") as? String else {
            print("unable to get fire class")
            return nil
        }
        guard let currentExtinguishingMethods = JSONParser.getArray(from: jsonData, key: "extinguish") as? [String] else {
            print("unable to get extinguishing methods")
            return nil
        }
        guard let currentFireType = JSONParser.getObject(from: jsonData, key: "fireType") as? String else {
            print("unable to get fire type")
            return nil
        }
        guard let currentLocations = JSONParser.getArray(from: jsonData, key: "location") as? [String] else {
            print("unable to get locations")
            return nil
        }
        fireClass = currentFireClass
        extinguishingMethods = currentExtinguishingMethods
        fireType = currentFireType
        locations = currentLocations.compactMap { RoomType.roomNameToType[$0] }
    }
}
