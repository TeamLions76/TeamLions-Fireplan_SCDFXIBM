//
//  ViewController.swift
//  Fireplan
//
//  Created by Hol Yin Ho on 12/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var floorPlan1: FloorPlan!
    var floorPlan2: FloorPlan!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        floorPlan1 = FloorPlan(frame: view.frame)
        addRoomsToFloorPlan1()
        view.addSubview(floorPlan1)

        floorPlan2 = FloorPlan(frame: view.frame)
        addRoomsToFloorPlan2()
        //view.addSubview(floorPlan2)
    }

    func addRoomsToFloorPlan2() {
        let height = UIScreen.main.bounds.height
        let width = UIScreen.main.bounds.width
    let house = Room(
            roomName: "",
            frame: CGRect(origin: CGPoint(x: 50, y: 50), size: CGSize(width: width - 100, height: height - 100)))
        floorPlan2.addSubview(house)

        let stairsSize = CGSize(width: 65, height: 10)

        let stairs1Origin = CGPoint(x: 60, y: 60)
        let stairs1 = Room(roomName: "", frame: CGRect(origin: stairs1Origin, size: stairsSize))
        floorPlan2.addSubview(stairs1)
        let stairs2Origin = CGPoint(x: 60, y: 70)
        let stairs2 = Room(roomName: "", frame: CGRect(origin: stairs2Origin, size: stairsSize))
         floorPlan2.addSubview(stairs2)
        let stairs3Origin = CGPoint(x: 60, y: 80)
        let stairs3 = Room(roomName: "", frame: CGRect(origin: stairs3Origin, size: stairsSize))
         floorPlan2.addSubview(stairs3)
        let stairs4Origin = CGPoint(x: 60, y: 90)
        let stairs4 = Room(roomName: "", frame: CGRect(origin: stairs4Origin, size: stairsSize))
         floorPlan2.addSubview(stairs4)
        let stairs5Origin = CGPoint(x: 60, y: 100)
        let stairs5 = Room(roomName: "", frame: CGRect(origin: stairs5Origin, size: stairsSize))
         floorPlan2.addSubview(stairs5)
        let stairs6Origin = CGPoint(x: 60, y: 110)
        let stairs6 = Room(roomName: "", frame: CGRect(origin: stairs6Origin, size: stairsSize))
         floorPlan2.addSubview(stairs6)
        let stairs7Origin = CGPoint(x: 60, y: 120)
        let stairs7 = Room(roomName: "", frame: CGRect(origin: stairs7Origin, size: stairsSize))
         floorPlan2.addSubview(stairs7)
        let stairs8Origin = CGPoint(x: 60, y: 130)
        let stairs8 = Room(roomName: "", frame: CGRect(origin: stairs8Origin, size: stairsSize))
         floorPlan2.addSubview(stairs8)
        let stairs9Origin = CGPoint(x: 60, y: 140)
        let stairs9 = Room(roomName: "", frame: CGRect(origin: stairs9Origin, size: stairsSize))
         floorPlan2.addSubview(stairs9)
        let stairs10Origin = CGPoint(x: 60, y: 150)
        let stairs10 = Room(roomName: "", frame: CGRect(origin: stairs10Origin, size: stairsSize))
         floorPlan2.addSubview(stairs10)
        
        let bedroom2Origin = CGPoint(x: 135, y: 60)
        let bedroom2Size = CGSize(width: width / 4, height: 120)
        let bedroom2 = Room(roomName: "Bed 2", frame: CGRect(origin: bedroom2Origin, size: bedroom2Size))
         floorPlan2.addSubview(bedroom2)
        
        let bedroom3Origin = CGPoint(
            x: bedroom2Origin.x + bedroom2Size.width,
            y: bedroom2Origin.y + 20
        )
        let bedroom3Size = CGSize(width: width - 130 - stairsSize.width - bedroom2Size.width, height: 130)
        let bedroom3 = Room(roomName: "Bed 3", frame: CGRect(origin: bedroom3Origin, size: bedroom3Size))
         floorPlan2.addSubview(bedroom3)
        
        let bathroom3Origin = CGPoint(
            x: bedroom3Origin.x + (bedroom3Size.width / 3 ),
            y: bedroom3Origin.y + bedroom3Size.height
        )
        let bathroom3Size = CGSize(width: (bedroom3Size.width / 3) * 2, height: 30)
        let bathroom3 = Room(roomName: "Bath 3", frame: CGRect(origin: bathroom3Origin, size: bathroom3Size))
         floorPlan2.addSubview(bathroom3)
        
        let storageOrigin = CGPoint(x: bedroom3Origin.x , y: bathroom3Origin.y + bathroom3Size.height)
        let storageSize = CGSize(width: bedroom3Size.width, height: bedroom3Size.height / 2)
        let storage = Room(roomName: "Storage", frame: CGRect(origin:storageOrigin , size:storageSize))
         floorPlan2.addSubview(storage)
        
        let masterBathroomOrigin = CGPoint(
            x: bedroom3Origin.x + (bedroom3Size.width / 3 ),
            y: storageOrigin.y + storageSize.height
        )
        let masterBathroomSize = bathroom3Size
        let masterBathroom = Room(roomName: "M.Bath", frame: CGRect(origin: masterBathroomOrigin, size: masterBathroomSize))
         floorPlan2.addSubview(masterBathroom)
        
        let masterBedroomOrigin = CGPoint(
            x: bedroom2Origin.x + bedroom2Size.width / 2,
            y:masterBathroomOrigin.y + masterBathroomSize.height
        )
        let masterBedroomSize = CGSize(width: bedroom2Size.width / 2 + bedroom3Size.width, height: width / 4)
        let masterBedroom = Room(roomName: "M.Bed", frame: CGRect(origin: masterBedroomOrigin, size: masterBedroomSize))
         floorPlan2.addSubview(masterBedroom)
        
        let familyRoomSize = CGSize(width: width - 140 - masterBedroomSize.width, height: storageSize.height + masterBathroomSize.height + masterBedroomSize.height)
        let familyRoomOrigin = CGPoint( x: 80, y: storageOrigin.y)
        let familyRoom = Room(roomName: "Family Room", frame: CGRect(origin: familyRoomOrigin, size: familyRoomSize))
               floorPlan2.addSubview(familyRoom)
        
        let balconyOrigin = CGPoint( x: familyRoomOrigin.x, y: familyRoomOrigin.y + familyRoomSize.height)
        let balconySize = CGSize(width: familyRoomSize.width +  masterBedroomSize.width / 2, height: width / 6)
        
        let balcony = Room(roomName: "Balcony", frame: CGRect(origin: balconyOrigin, size: balconySize))
               floorPlan2.addSubview(balcony)
        
    }


    func addRoomsToFloorPlan1() {
        let height = UIScreen.main.bounds.height
        let width = UIScreen.main.bounds.width
        let house = Room(
            roomName: "",
            frame: CGRect(origin: CGPoint(x: 50, y: 50), size: CGSize(width: width - 100, height: height - 100)))
        floorPlan1.addSubview(house)

        let livingRoom = Room(
            roomName: "Living Room",
            frame: CGRect(origin:
                CGPoint(x: 80, y: height / 2),
                          size: CGSize(width: (width / 2) - 20, height: width / 4)))
        floorPlan1.addSubview(livingRoom)

        let carPorch = Room(
            roomName: "Car Porch",
            frame: CGRect(origin:
                CGPoint(x: 60, y: (height / 2) + livingRoom.frame.height + 10),
                          size: CGSize(width: width / 2, height: width * 0.3215)))
        floorPlan1.addSubview(carPorch)

        let study = Room(
            roomName: "Study",
            frame: CGRect(origin:
                CGPoint(x: 80, y: (height / 2) - livingRoom.frame.height),
                          size: CGSize(width: width / 4, height: width / 4)))
        floorPlan1.addSubview(study)

        let bedroom1 = Room(
            roomName: "Bed 1",
            frame: CGRect(origin:
                CGPoint(x: 80 + (width / 2) - 20, y: height / 2),
                          size: CGSize(width: house.frame.width - livingRoom.frame.width - 40, height: width / 4)))
        floorPlan1.addSubview(bedroom1)

        let bathroomOrigin = CGPoint(
            x: 80 + (width / 2) - 20 + ((1 / 3) * bedroom1.frame.width) - 5,
            y: (height / 2) - ((1 / 3) * (bedroom1.frame.height))
        )
        let bathroomSize = CGSize(width: (2 / 3) * bedroom1.frame.width + 5, height: (1 / 3) * bedroom1.frame.height)
        let bathroom = Room(roomName: "Bath 1", frame: CGRect(origin: bathroomOrigin, size: bathroomSize))
        floorPlan1.addSubview(bathroom)


        let maidroomOrigin = CGPoint(
            x: bathroomOrigin.x,
            y: bathroomOrigin.y - (2 * bathroomSize.height)
        )
        let maidroomSize = CGSize(width: bathroomSize.width, height: bathroomSize.height * 2)
        let maidroom = Room(roomName: "Maid", frame: CGRect(origin: maidroomOrigin, size: maidroomSize))
        floorPlan1.addSubview(maidroom)

        let bathroom2Origin = CGPoint(x: maidroomOrigin.x, y: maidroomOrigin.y - bathroomSize.height)
        let bathroom2Size = bathroomSize
        let bathroom2 = Room(roomName: "Bath 2", frame: CGRect(origin: bathroom2Origin, size: bathroom2Size))
        floorPlan1.addSubview(bathroom2)

        let utilityRoomOrigin = CGPoint(x: maidroomOrigin.x - maidroomSize.height, y: maidroomOrigin.y)
        let utilityRoomSize = CGSize(width: maidroomSize.height, height: maidroomSize.height)
        let utilityRoom = Room(roomName: "Utility", frame: CGRect(origin: utilityRoomOrigin, size: utilityRoomSize))
        floorPlan1.addSubview(utilityRoom)

        let wetKitchenOrigin = CGPoint(x: bedroom1.frame.origin.x, y: 60)
        let wetKitchenSize = CGSize(width: bedroom1.frame.width, height: 180 - bathroom2Size.height)
        let wetKitchen = Room(roomName: "Kitchen", frame: CGRect(origin: wetKitchenOrigin, size: wetKitchenSize))
        floorPlan1.addSubview(wetKitchen)

        let diningHallOrigin = CGPoint(x: study.frame.origin.x + (study.frame.width / 2), y: wetKitchenOrigin.y)
        let diningHallSize = CGSize(width: width - 255, height: wetKitchenSize.height)
        let diningHall = Room(roomName: "Dining Hall", frame: CGRect(origin: diningHallOrigin, size: diningHallSize))
        floorPlan1.addSubview(diningHall)

        
        let stairsSize = CGSize(width: 65, height: 10)

        let stairs1Origin = CGPoint(x: 60, y: 60)
        let stairs1 = Room(roomName: "", frame: CGRect(origin: stairs1Origin, size: stairsSize))
        floorPlan1.addSubview(stairs1)
        let stairs2Origin = CGPoint(x: 60, y: 70)
        let stairs2 = Room(roomName: "", frame: CGRect(origin: stairs2Origin, size: stairsSize))
        floorPlan1.addSubview(stairs2)
        let stairs3Origin = CGPoint(x: 60, y: 80)
        let stairs3 = Room(roomName: "", frame: CGRect(origin: stairs3Origin, size: stairsSize))
        floorPlan1.addSubview(stairs3)
        let stairs4Origin = CGPoint(x: 60, y: 90)
        let stairs4 = Room(roomName: "", frame: CGRect(origin: stairs4Origin, size: stairsSize))
        floorPlan1.addSubview(stairs4)
        let stairs5Origin = CGPoint(x: 60, y: 100)
        let stairs5 = Room(roomName: "", frame: CGRect(origin: stairs5Origin, size: stairsSize))
        floorPlan1.addSubview(stairs5)
        let stairs6Origin = CGPoint(x: 60, y: 110)
        let stairs6 = Room(roomName: "", frame: CGRect(origin: stairs6Origin, size: stairsSize))
        floorPlan1.addSubview(stairs6)
        let stairs7Origin = CGPoint(x: 60, y: 120)
        let stairs7 = Room(roomName: "", frame: CGRect(origin: stairs7Origin, size: stairsSize))
        floorPlan1.addSubview(stairs7)
        let stairs8Origin = CGPoint(x: 60, y: 130)
        let stairs8 = Room(roomName: "", frame: CGRect(origin: stairs8Origin, size: stairsSize))
        floorPlan1.addSubview(stairs8)
        let stairs9Origin = CGPoint(x: 60, y: 140)
        let stairs9 = Room(roomName: "", frame: CGRect(origin: stairs9Origin, size: stairsSize))
        floorPlan1.addSubview(stairs9)
        let stairs10Origin = CGPoint(x: 60, y: 150)
        let stairs10 = Room(roomName: "", frame: CGRect(origin: stairs10Origin, size: stairsSize))
        floorPlan1.addSubview(stairs10)
    }

}

