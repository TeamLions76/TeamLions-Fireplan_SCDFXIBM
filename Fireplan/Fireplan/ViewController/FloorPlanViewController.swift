//
//  FloorPlanViewController.swift
//  Fireplan
//
//  Created by Hol Yin Ho on 12/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

import UIKit

class FloorPlanViewController: UIViewController {
    var floorPlan1: FloorPlan!
    var floorPlan2: FloorPlan!
    var selectedFloorPlan: FloorPlan!
    var levelSwitch: ToggleFloorSwitch!
    var rooms: [Room] = []
    var roomsOnFire: [Room] = []
    var allFireTypes: [FireType] = []
    var currentlyOpenedInfoWindow: InfoWindow?
    var homeLabel: UILabel!
    var settingsButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        let height = UIScreen.main.bounds.height
        let width = UIScreen.main.bounds.width

        let iconSide: CGFloat = 40

        homeLabel = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 5), size: CGSize(width: width, height: 40)))
        homeLabel.text = "HOME"
        homeLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        homeLabel.textAlignment = .center
        homeLabel.font = UIFont.boldSystemFont(ofSize: 20.0)

        settingsButton = UIButton(
            frame: CGRect(origin: CGPoint(x: width - iconSide - 5, y: 10),
            size: CGSize(width: iconSide, height: iconSide)))
        settingsButton.setImage(UIImage(named: "Setting"), for: .normal)

        floorPlan1 = FloorPlan(frame: view.frame)
        selectedFloorPlan = floorPlan1
        addRoomsToFloorPlan1()
        view.addSubview(floorPlan1)
        view.addSubview(homeLabel)
        view.addSubview(settingsButton)

        levelSwitch = ToggleFloorSwitch(origin: CGPoint(x: (width / 2) - 40, y: height - 45))
        levelSwitch.observer = self
        view.addSubview(levelSwitch)

        floorPlan2 = FloorPlan(frame: view.frame)
        addRoomsToFloorPlan2()

        bindGestureRecognizers()

        setUpRooms()
        // randomlySetFire()
    }

    func bindGestureRecognizers() {
        settingsButton.addTarget(self, action: #selector(segueToSettings(_:)), for: .touchUpInside)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsViewController = segue.destination as? SettingsViewController else {
            return
        }
        settingsViewController.allFireTypes = allFireTypes
    }

    @objc func segueToSettings(_ sender: UIButton) {
        performSegue(withIdentifier: "toSettings", sender: sender)
    }

    // To test fire, uncomment in `ViewDidLoad`
    func randomlySetFire() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let fireSizes: [FireSize] = [.small, .medium, .large]
            let randomFireIndex = Int.random(in: 0..<fireSizes.count)
            let randomIndex = Int.random(in: 0..<self.rooms.count)
            self.rooms[randomIndex].fireWasDetected(fireSize: fireSizes[randomFireIndex])
        }
    }

    func setUpRooms() {
        rooms.forEach {
            $0.observer = self
        }
    }

    private func addRoomsToFloorPlan2() {
        let height = UIScreen.main.bounds.height
        let width = UIScreen.main.bounds.width
        let stairsSize = CGSize(width: 65, height: 10)
        let house = Room(
            roomName: "",
            roomType: .Living,
            level: 2,
            frame: CGRect(origin: CGPoint(x: 50, y: 50), size: CGSize(width: width - 100, height: height - 100)))
        house.layer.borderWidth = 3
        floorPlan2.addSubview(house)

        let bedroom2Origin = CGPoint(x: 135, y: 60)
        let bedroom2Size = CGSize(width: width / 4, height: 120)
        let bedroom2 = Room(
            roomName: "Bed 2",
            roomType: .Bedroom,
            level: 2,
            frame: CGRect(origin: bedroom2Origin, size: bedroom2Size))
        floorPlan2.addSubview(bedroom2)
        rooms.append(bedroom2)
        
        let bedroom3Origin = CGPoint(
            x: bedroom2Origin.x + bedroom2Size.width,
            y: bedroom2Origin.y + 20
        )
        let bedroom3Size = CGSize(width: width - 130 - stairsSize.width - bedroom2Size.width, height: 130)
        let bedroom3 = Room(
            roomName: "Bed 3",
            roomType: .Bedroom,
            level: 2,
            frame: CGRect(origin: bedroom3Origin, size: bedroom3Size))
        floorPlan2.addSubview(bedroom3)
        rooms.append(bedroom3)
        
        let bathroom3Origin = CGPoint(
            x: bedroom3Origin.x + (bedroom3Size.width / 3 ),
            y: bedroom3Origin.y + bedroom3Size.height
        )
        let bathroom3Size = CGSize(width: (bedroom3Size.width / 3) * 2, height: 30)
        let bathroom3 = Room(
            roomName: "Bath 3",
            roomType: .Bath,
            level: 2,
            frame: CGRect(origin: bathroom3Origin, size: bathroom3Size))
        floorPlan2.addSubview(bathroom3)
        rooms.append(bathroom3)
        
        let storageOrigin = CGPoint(x: bedroom3Origin.x , y: bathroom3Origin.y + bathroom3Size.height)
        let storageSize = CGSize(width: bedroom3Size.width, height: bedroom3Size.height / 2)
        let storage = Room(
            roomName: "Storage",
            roomType: .Utility,
            level: 2,
            frame: CGRect(origin:storageOrigin , size:storageSize))
        floorPlan2.addSubview(storage)
        rooms.append(storage)
        
        let masterBathroomOrigin = CGPoint(
            x: bedroom3Origin.x + (bedroom3Size.width / 3 ),
            y: storageOrigin.y + storageSize.height
        )
        let masterBathroomSize = bathroom3Size
        let masterBathroom = Room(
            roomName: "M.Bath",
            roomType: .Bath,
            level: 2,
            frame: CGRect(origin: masterBathroomOrigin, size: masterBathroomSize))
        floorPlan2.addSubview(masterBathroom)
        rooms.append(masterBathroom)
        
        let masterBedroomOrigin = CGPoint(
            x: bedroom2Origin.x + bedroom2Size.width / 2,
            y:masterBathroomOrigin.y + masterBathroomSize.height
        )
        let masterBedroomSize = CGSize(width: bedroom2Size.width / 2 + bedroom3Size.width, height: width / 4)
        let masterBedroom = Room(
            roomName: "M.Bed",
            roomType: .Bedroom,
            level: 2,
            frame: CGRect(origin: masterBedroomOrigin, size: masterBedroomSize))
        floorPlan2.addSubview(masterBedroom)
        rooms.append(masterBedroom)
        
        let familyRoomSize = CGSize(width: width - 140 - masterBedroomSize.width, height: storageSize.height + masterBathroomSize.height + masterBedroomSize.height)
        let familyRoomOrigin = CGPoint( x: 80, y: storageOrigin.y)
        let familyRoom = Room(
            roomName: "Family Room",
            roomType: .Living,
            level: 2,
            frame: CGRect(origin: familyRoomOrigin, size: familyRoomSize))
        floorPlan2.addSubview(familyRoom)
        rooms.append(familyRoom)
        
        let balconyOrigin = CGPoint( x: familyRoomOrigin.x, y: familyRoomOrigin.y + familyRoomSize.height)
        let balconySize = CGSize(width: familyRoomSize.width +  masterBedroomSize.width / 2, height: width / 6)
        
        let balcony = Room(
            roomName: "Balcony",
            roomType: .Living,
            level: 2,
            frame: CGRect(origin: balconyOrigin, size: balconySize))
        floorPlan2.addSubview(balcony)
        rooms.append(balcony)

        FloorPlanViewController.addStairs(to: floorPlan2)
    }


    private func addRoomsToFloorPlan1() {
        let height = UIScreen.main.bounds.height
        let width = UIScreen.main.bounds.width
        let house = Room(
            roomName: "",
            roomType: .Living,
            level: 1,
            frame: CGRect(origin: CGPoint(x: 50, y: 50), size: CGSize(width: width - 100, height: height - 100)))
        house.layer.borderWidth = 3
        floorPlan1.addSubview(house)

        let livingRoom = Room(
            roomName: "Living Room",
            roomType: .Living,
            level: 1,
            frame: CGRect(origin:
                CGPoint(x: 80, y: height / 2),
                          size: CGSize(width: (width / 2) - 20, height: width / 4)))
        floorPlan1.addSubview(livingRoom)
        rooms.append(livingRoom)

        let carPorch = Room(
            roomName: "Car Porch",
            roomType: .Living,
            level: 1,
            frame: CGRect(origin:
                CGPoint(x: 60, y: (height / 2) + livingRoom.frame.height + 10),
                          size: CGSize(width: width / 2, height: width * 0.3215)))
        floorPlan1.addSubview(carPorch)
        rooms.append(carPorch)

        let study = Room(
            roomName: "Study",
            roomType: .Living,
            level: 1,
            frame: CGRect(origin:
                CGPoint(x: 80, y: (height / 2) - livingRoom.frame.height),
                          size: CGSize(width: width / 4, height: width / 4)))
        floorPlan1.addSubview(study)
        rooms.append(study)

        let bedroom1 = Room(
            roomName: "Bed 1",
            roomType: .Bedroom,
            level: 1,
            frame: CGRect(origin:
                CGPoint(x: 80 + (width / 2) - 20, y: height / 2),
                          size: CGSize(width: house.frame.width - livingRoom.frame.width - 40, height: width / 4)))
        floorPlan1.addSubview(bedroom1)
        rooms.append(bedroom1)

        let bathroomOrigin = CGPoint(
            x: 80 + (width / 2) - 20 + ((1 / 3) * bedroom1.frame.width) - 5,
            y: (height / 2) - ((1 / 3) * (bedroom1.frame.height))
        )
        let bathroomSize = CGSize(width: (2 / 3) * bedroom1.frame.width + 5, height: (1 / 3) * bedroom1.frame.height)
        let bathroom = Room(
            roomName: "Bath 1",
            roomType: .Bath,
            level: 1,
            frame: CGRect(origin: bathroomOrigin, size: bathroomSize))
        floorPlan1.addSubview(bathroom)
        rooms.append(bathroom)


        let maidroomOrigin = CGPoint(
            x: bathroomOrigin.x,
            y: bathroomOrigin.y - (2 * bathroomSize.height)
        )
        let maidroomSize = CGSize(width: bathroomSize.width, height: bathroomSize.height * 2)
        let maidroom = Room(
            roomName: "Maid",
            roomType: .Bedroom,
            level: 1,
            frame: CGRect(origin: maidroomOrigin, size: maidroomSize))
        floorPlan1.addSubview(maidroom)
        rooms.append(maidroom)

        let bathroom2Origin = CGPoint(x: maidroomOrigin.x, y: maidroomOrigin.y - bathroomSize.height)
        let bathroom2Size = bathroomSize
        let bathroom2 = Room(
            roomName: "Bath 2",
            roomType: .Bath,
            level: 1,
            frame: CGRect(origin: bathroom2Origin, size: bathroom2Size))
        floorPlan1.addSubview(bathroom2)
        rooms.append(bathroom2)

        let utilityRoomOrigin = CGPoint(x: maidroomOrigin.x - maidroomSize.height, y: maidroomOrigin.y)
        let utilityRoomSize = CGSize(width: maidroomSize.height, height: maidroomSize.height)
        let utilityRoom = Room(
            roomName: "Utility",
            roomType: .Utility,
            level: 1,
            frame: CGRect(origin: utilityRoomOrigin, size: utilityRoomSize))
        floorPlan1.addSubview(utilityRoom)
        rooms.append(utilityRoom)

        let wetKitchenOrigin = CGPoint(x: bedroom1.frame.origin.x, y: 60)
        let wetKitchenSize = CGSize(width: bedroom1.frame.width, height: 180 - bathroom2Size.height)
        let wetKitchen = Room(
            roomName: "Kitchen",
            roomType: .Kitchen,
            level: 1,
            frame: CGRect(origin: wetKitchenOrigin, size: wetKitchenSize))
        floorPlan1.addSubview(wetKitchen)
        rooms.append(wetKitchen)

        let diningHallOrigin = CGPoint(x: study.frame.origin.x + (study.frame.width / 2), y: wetKitchenOrigin.y)
        let diningHallSize = CGSize(width: width - 255, height: wetKitchenSize.height)
        let diningHall = Room(
            roomName: "Dining Hall",
            roomType: .Dining,
            level: 1,
            frame: CGRect(origin: diningHallOrigin, size: diningHallSize))
        floorPlan1.addSubview(diningHall)
        rooms.append(diningHall)

        FloorPlanViewController.addStairs(to: floorPlan1)
    }

    private static func addStairs(to floorPlan: FloorPlan) {
        let stairsSize = CGSize(width: 65, height: 10)

        let stairs1Origin = CGPoint(x: 60, y: 60)
        let stairs1 = Room(roomName: "", roomType: .Living, level: 1, frame: CGRect(origin: stairs1Origin, size: stairsSize))
        floorPlan.addSubview(stairs1)
        let stairs2Origin = CGPoint(x: 60, y: 70)
        let stairs2 = Room(roomName: "", roomType: .Living, level: 1, frame: CGRect(origin: stairs2Origin, size: stairsSize))
        floorPlan.addSubview(stairs2)
        let stairs3Origin = CGPoint(x: 60, y: 80)
        let stairs3 = Room(roomName: "", roomType: .Living, level: 1, frame: CGRect(origin: stairs3Origin, size: stairsSize))
        floorPlan.addSubview(stairs3)
        let stairs4Origin = CGPoint(x: 60, y: 90)
        let stairs4 = Room(roomName: "", roomType: .Living, level: 1, frame: CGRect(origin: stairs4Origin, size: stairsSize))
        floorPlan.addSubview(stairs4)
        let stairs5Origin = CGPoint(x: 60, y: 100)
        let stairs5 = Room(roomName: "", roomType: .Living, level: 1, frame: CGRect(origin: stairs5Origin, size: stairsSize))
        floorPlan.addSubview(stairs5)
        let stairs6Origin = CGPoint(x: 60, y: 110)
        let stairs6 = Room(roomName: "", roomType: .Living, level: 1, frame: CGRect(origin: stairs6Origin, size: stairsSize))
        floorPlan.addSubview(stairs6)
        let stairs7Origin = CGPoint(x: 60, y: 120)
        let stairs7 = Room(roomName: "", roomType: .Living, level: 1, frame: CGRect(origin: stairs7Origin, size: stairsSize))
        floorPlan.addSubview(stairs7)
        let stairs8Origin = CGPoint(x: 60, y: 130)
        let stairs8 = Room(roomName: "", roomType: .Living, level: 1, frame: CGRect(origin: stairs8Origin, size: stairsSize))
        floorPlan.addSubview(stairs8)
        let stairs9Origin = CGPoint(x: 60, y: 140)
        let stairs9 = Room(roomName: "", roomType: .Living, level: 1, frame: CGRect(origin: stairs9Origin, size: stairsSize))
        floorPlan.addSubview(stairs9)
        let stairs10Origin = CGPoint(x: 60, y: 150)
        let stairs10 = Room(roomName: "", roomType: .Living, level: 1, frame: CGRect(origin: stairs10Origin, size: stairsSize))
        floorPlan.addSubview(stairs10)
    }
}

extension FloorPlanViewController: SwitchObserver {
    func didSelectLevel1() {
        selectedFloorPlan = floorPlan1
        floorPlan2.removeFromSuperview()
        view.addSubview(floorPlan1)
        view.bringSubviewToFront(levelSwitch)
        view.bringSubviewToFront(homeLabel)
        view.bringSubviewToFront(settingsButton)
    }

    func didSelectLevel2() {
        selectedFloorPlan = floorPlan2
        floorPlan1.removeFromSuperview()
        view.addSubview(floorPlan2)
        view.bringSubviewToFront(levelSwitch)
        view.bringSubviewToFront(homeLabel)
        view.bringSubviewToFront(settingsButton)
    }
}

extension FloorPlanViewController: RoomObserver {
    func roomDidSetOnFire(room: Room) {
        // For demonstration purpose, only allow one room to be on fire at one time
        if !roomsOnFire.isEmpty {
            room.stopFire()
            return
        }
        roomsOnFire.append(room)
        room.level == 1 ? levelSwitch.selectLevel1() : levelSwitch.selectLevel2()
        let possibleFireTypes = allFireTypes.filter { $0.locations.contains(room.roomType) }
        let extinguisherIcon = possibleFireTypes.isEmpty
            ? UIImage(named: "WaterExtinguisher")
            : UIImage(named: possibleFireTypes[0].extinguishingMethods[0])
        let isEvacuate = room.fireSize == .large
        let image = isEvacuate ? UIImage(named: "SCDF") : extinguisherIcon
        let text = isEvacuate ? "EVACUATE!" : "FIRE ALERT!"
        let alertWindow = AlertWindow(text: text, image: image, isEvacuate: isEvacuate)
        alertWindow.observer = self
        view.addSubview(alertWindow)
    }

    func roomIsTapped(room: Room) {
        currentlyOpenedInfoWindow?.removeFromSuperview()
        let possibleFireTypes = allFireTypes.filter { $0.locations.contains(room.roomType) }
        let infoWindow = InfoWindow(room: room, potentialFireTypes: possibleFireTypes)
        currentlyOpenedInfoWindow = infoWindow
        view.addSubview(infoWindow)
    }
}

extension FloorPlanViewController: AlertObserver {
    func alertDidClose(alert: AlertWindow, isSendLocation: Bool) {
        let alertInfoWindow = AlertInfoWindow(isSendLocation: isSendLocation)
        view.addSubview(alertInfoWindow)
    }
}
