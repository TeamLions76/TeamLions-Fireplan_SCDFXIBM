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
    let roomType: RoomType
    private var displayLink: CADisplayLink?
    private var reds: [CGColor] = [#colorLiteral(red: 1, green: 0.1906917691, blue: 0, alpha: 1), #colorLiteral(red: 0.9374032021, green: 0.291980505, blue: 0, alpha: 1), #colorLiteral(red: 0.8689120412, green: 0.2870525122, blue: 0, alpha: 1), #colorLiteral(red: 0.7658892274, green: 0.244256705, blue: 0.003047145903, alpha: 1), #colorLiteral(red: 0.6353023052, green: 0.2032178938, blue: 0.01525276713, alpha: 1), #colorLiteral(red: 0.5147069693, green: 0.1652458012, blue: 0.02172833309, alpha: 1), #colorLiteral(red: 0.4189986587, green: 0.1350331008, blue: 0.02390548587, alpha: 1), #colorLiteral(red: 0.2602037191, green: 0.08463910967, blue: 0.02252609096, alpha: 1), #colorLiteral(red: 0.1051820144, green: 0.0348829329, blue: 0.01219188701, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.1051820144, green: 0.0348829329, blue: 0.01219188701, alpha: 1), #colorLiteral(red: 0.2602037191, green: 0.08463910967, blue: 0.02252609096, alpha: 1), #colorLiteral(red: 0.4189986587, green: 0.1350331008, blue: 0.02390548587, alpha: 1), #colorLiteral(red: 0.5147069693, green: 0.1652458012, blue: 0.02172833309, alpha: 1), #colorLiteral(red: 0.6353023052, green: 0.2032178938, blue: 0.01525276713, alpha: 1), #colorLiteral(red: 0.7658892274, green: 0.244256705, blue: 0.003047145903, alpha: 1), #colorLiteral(red: 0.8689120412, green: 0.2870525122, blue: 0, alpha: 1), #colorLiteral(red: 0.9374032021, green: 0.291980505, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.1906917691, blue: 0, alpha: 1)]
    private var colorIndex = 0
    var observer: RoomObserver?
    let level: Int
    var fireSize: FireSize?

    init(roomName: String, roomType: RoomType, level: Int, frame: CGRect) {
        self.roomName = roomName
        self.roomType = roomType
        self.level = level
        super.init(frame: frame)

        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)

        let roomLabel = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: (frame.height / 2) - 15), size: CGSize(width: frame.width, height: 30)))
        roomLabel.text = roomName
        roomLabel.textAlignment = .center
        roomLabel.font = roomLabel.font.withSize(15)
        roomLabel.textColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)

        addSubview(roomLabel)
    }

    func makeTappable() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        addGestureRecognizer(tap)
    }

    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        observer?.roomIsTapped(room: self)
    }

    required init?(coder: NSCoder) {
        nil
    }

    func triggerFire(fireSize: FireSize) {
        self.fireSize = fireSize
        displayLink = CADisplayLink(target: self, selector: #selector(updateAnimation))
        displayLink?.preferredFramesPerSecond = fireSize.rawValue
        displayLink?.add(to: RunLoop.main, forMode: .common)
        observer?.roomDidSetOnFire(room: self)
    }

    func stopFire() {
        displayLink?.invalidate()
        backgroundColor = nil
    }

    @objc func updateAnimation() {
        layer.backgroundColor = reds[colorIndex]
        colorIndex = (colorIndex + 1) % reds.count
    }
}
