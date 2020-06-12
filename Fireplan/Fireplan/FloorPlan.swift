//
//  FloorPlan.swift
//  Fireplan
//
//  Created by Hol Yin Ho on 12/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

import UIKit

class FloorPlan: UIView {
    static let backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = FloorPlan.backgroundColor
        let height = UIScreen.main.bounds.height
        let width = UIScreen.main.bounds.width
        
        let house = Room(
            roomName: "",
            frame: CGRect(origin: CGPoint(x: 50, y: 50), size: CGSize(width: width - 100, height: height - 100)))
        addSubview(house)

        let stairsSize = CGSize(width: 65, height: 10)

        let stairs1Origin = CGPoint(x: 60, y: 60)
        let stairs1 = Room(roomName: "", frame: CGRect(origin: stairs1Origin, size: stairsSize))
        addSubview(stairs1)
        let stairs2Origin = CGPoint(x: 60, y: 70)
        let stairs2 = Room(roomName: "", frame: CGRect(origin: stairs2Origin, size: stairsSize))
        addSubview(stairs2)
        let stairs3Origin = CGPoint(x: 60, y: 80)
        let stairs3 = Room(roomName: "", frame: CGRect(origin: stairs3Origin, size: stairsSize))
        addSubview(stairs3)
        let stairs4Origin = CGPoint(x: 60, y: 90)
        let stairs4 = Room(roomName: "", frame: CGRect(origin: stairs4Origin, size: stairsSize))
        addSubview(stairs4)
        let stairs5Origin = CGPoint(x: 60, y: 100)
        let stairs5 = Room(roomName: "", frame: CGRect(origin: stairs5Origin, size: stairsSize))
        addSubview(stairs5)
        let stairs6Origin = CGPoint(x: 60, y: 110)
        let stairs6 = Room(roomName: "", frame: CGRect(origin: stairs6Origin, size: stairsSize))
        addSubview(stairs6)
        let stairs7Origin = CGPoint(x: 60, y: 120)
        let stairs7 = Room(roomName: "", frame: CGRect(origin: stairs7Origin, size: stairsSize))
        addSubview(stairs7)
        let stairs8Origin = CGPoint(x: 60, y: 130)
        let stairs8 = Room(roomName: "", frame: CGRect(origin: stairs8Origin, size: stairsSize))
        addSubview(stairs8)
        let stairs9Origin = CGPoint(x: 60, y: 140)
        let stairs9 = Room(roomName: "", frame: CGRect(origin: stairs9Origin, size: stairsSize))
        addSubview(stairs9)
        let stairs10Origin = CGPoint(x: 60, y: 150)
        let stairs10 = Room(roomName: "", frame: CGRect(origin: stairs10Origin, size: stairsSize))
        addSubview(stairs10)
    }

    required init?(coder: NSCoder) {
        nil
    }
}
