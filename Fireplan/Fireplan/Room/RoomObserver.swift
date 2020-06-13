//
//  RoomObserver.swift
//  Fireplan
//
//  Created by Hol Yin Ho on 13/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

protocol RoomObserver {
    func roomDidSetOnFire(room: Room)

    func roomIsTapped(room: Room)
}
