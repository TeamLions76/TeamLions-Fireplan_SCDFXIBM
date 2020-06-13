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
        
        let bedroom2Origin = CGPoint(x: 135, y: 60)
        let bedroom2Size = CGSize(width: width / 4, height: 120)
        let bedroom2 = Room(roomName: "Bed 2", frame: CGRect(origin: bedroom2Origin, size: bedroom2Size))
        addSubview(bedroom2)
        
        let bedroom3Origin = CGPoint(
            x: bedroom2Origin.x + bedroom2Size.width,
            y: bedroom2Origin.y + 20
        )
        let bedroom3Size = CGSize(width: width - 130 - stairsSize.width - bedroom2Size.width, height: 130)
        let bedroom3 = Room(roomName: "Bed 3", frame: CGRect(origin: bedroom3Origin, size: bedroom3Size))
        addSubview(bedroom3)
        
        let bathroom3Origin = CGPoint(
            x: bedroom3Origin.x + (bedroom3Size.width / 3 ),
            y: bedroom3Origin.y + bedroom3Size.height
        )
        let bathroom3Size = CGSize(width: (bedroom3Size.width / 3) * 2, height: 30)
        let bathroom3 = Room(roomName: "Bath 3", frame: CGRect(origin: bathroom3Origin, size: bathroom3Size))
        addSubview(bathroom3)
        
        let storageOrigin = CGPoint(x: bedroom3Origin.x , y: bathroom3Origin.y + bathroom3Size.height)
        let storageSize = CGSize(width: bedroom3Size.width, height: bedroom3Size.height / 2)
        let storage = Room(roomName: "Storage", frame: CGRect(origin:storageOrigin , size:storageSize))
        addSubview(storage)
        
        let masterBathroomOrigin = CGPoint(
            x: bedroom3Origin.x + (bedroom3Size.width / 3 ),
            y: storageOrigin.y + storageSize.height
        )
        let masterBathroomSize = bathroom3Size
        let masterBathroom = Room(roomName: "M.Bath", frame: CGRect(origin: masterBathroomOrigin, size: masterBathroomSize))
        addSubview(masterBathroom)
        
        let masterBedroomOrigin = CGPoint(
            x: bedroom2Origin.x + bedroom2Size.width / 2,
            y:masterBathroomOrigin.y + masterBathroomSize.height
        )
        let masterBedroomSize = CGSize(width: bedroom2Size.width / 2 + bedroom3Size.width, height: width / 4)
        let masterBedroom = Room(roomName: "M.Bed", frame: CGRect(origin: masterBedroomOrigin, size: masterBedroomSize))
        addSubview(masterBedroom)
        
        let familyRoomSize = CGSize(width: width - 140 - masterBedroomSize.width, height: storageSize.height + masterBathroomSize.height + masterBedroomSize.height)
        let familyRoomOrigin = CGPoint( x: 80, y: storageOrigin.y)
        let familyRoom = Room(roomName: "Family Room", frame: CGRect(origin: familyRoomOrigin, size: familyRoomSize))
              addSubview(familyRoom)
        
        let balconyOrigin = CGPoint( x: familyRoomOrigin.x, y: familyRoomOrigin.y + familyRoomSize.height)
        let balconySize = CGSize(width: familyRoomSize.width + masterBedroomSize.width / 2, height: width / 6)
        
        let balcony = Room(roomName: "Balcony", frame: CGRect(origin: balconyOrigin, size: balconySize))
              addSubview(balcony)
        
    }

    required init?(coder: NSCoder) {
        nil
    }
}
