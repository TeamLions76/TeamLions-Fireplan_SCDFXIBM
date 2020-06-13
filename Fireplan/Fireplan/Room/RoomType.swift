//
//  RoomType.swift
//  Fireplan
//
//  Created by Hol Yin Ho on 13/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

enum RoomType {
    case Bedroom
    case Kitchen
    case Utility
    case Dining
    case Living
    case Bath

    static let roomNameToType: [String: RoomType] = [
        "Bedroom": .Bedroom,
        "Kitchen": .Kitchen,
        "Utility": .Utility,
        "Dining": .Dining,
        "Living": .Living,
        "Bath": .Bath
    ]
}
