//
//  Room.swift
//  Fireplan
//
//  Created by Hol Yin Ho on 12/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//
import UIKit

class Room: UIView {
    let roomName: String

    init(roomName: String, frame: CGRect) {
        self.roomName = roomName
        super.init(frame: frame)

        layer.borderWidth = 2
        layer.borderColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)

        let roomLabel = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: (frame.height / 2) - 15), size: CGSize(width: frame.width, height: 30)))
        roomLabel.text = roomName
        roomLabel.textAlignment = .center
        roomLabel.font = roomLabel.font.withSize(15)
        roomLabel.textColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)

        addSubview(roomLabel)
    }

    required init?(coder: NSCoder) {
        nil
    }
}
