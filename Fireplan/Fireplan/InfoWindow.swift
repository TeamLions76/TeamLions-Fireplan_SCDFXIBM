//
//  InfoWindow.swift
//  Fireplan
//
//  Created by Hol Yin Ho on 13/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

import UIKit

class InfoWindow: UIView {
    let insets: CGFloat = 25
    var okButton: UILabel!

    init(room: Room, potentialFireTypes: [FireType]) {
        super.init(frame: CGRect(
            origin: CGPoint(x: 10, y: UIScreen.main.bounds.height / 4),
            size: CGSize(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height / 2)
        ))
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.cornerRadius = 10
        alpha = 0.95
        let labelCellWidth = (UIScreen.main.bounds.width - 20 - (2 * insets)) * 0.65
        let infoCellWidth = (UIScreen.main.bounds.width - 20 - (2 * insets)) * 0.35
        let gap: CGFloat = 5

        let header = UILabel(
            frame: CGRect(origin: CGPoint(x: insets, y: insets),
            size: CGSize(width: UIScreen.main.bounds.width - 20 - (2 * insets), height: 40)))
        header.text = "ROOM ASSESMENT"
        header.font = UIFont.boldSystemFont(ofSize: 20.0)
        addSubview(header)

        let roomLabel = UILabel(
            frame: CGRect(origin: CGPoint(x: header.frame.origin.x, y: header.frame.origin.y + header.frame.height),
            size: CGSize(width: labelCellWidth, height: 20)))
        roomLabel.text = "ROOM: "
        roomLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        addSubview(roomLabel)

        let roomInfo = UILabel(
            frame: CGRect(origin: CGPoint(x: header.frame.origin.x + labelCellWidth, y: header.frame.origin.y + header.frame.height),
            size: CGSize(width: infoCellWidth, height: 20)))
        roomInfo.text = room.roomName.uppercased()
        roomInfo.font = roomInfo.font.withSize(15)
        addSubview(roomInfo)

        let riskLabel = UILabel(
            frame: CGRect(origin: CGPoint(x: header.frame.origin.x, y: roomLabel.frame.origin.y + roomLabel.frame.height + gap),
                          size: CGSize(width: labelCellWidth, height: 20)))
        riskLabel.text = "RISK OF FIRE: "
        riskLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        addSubview(riskLabel)

        let riskInfo = UILabel(
            frame: CGRect(origin: CGPoint(x: header.frame.origin.x + labelCellWidth, y: roomInfo.frame.origin.y + roomInfo.frame.height + gap),
                          size: CGSize(width: infoCellWidth, height: 20)))
        riskInfo.text = potentialFireTypes.count > 1 ? "HIGH" : "LOW"
        riskInfo.font = riskInfo.font.withSize(15)
        addSubview(riskInfo)

        let potentialLabel = UILabel(
            frame: CGRect(origin: CGPoint(x: header.frame.origin.x, y: riskLabel.frame.origin.y + riskLabel.frame.height + gap),
                          size: CGSize(width: labelCellWidth, height: 20)))
        potentialLabel.text = "POTENTIAL FIRE TYPES: "
        potentialLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        addSubview(potentialLabel)

        var currentYValue = riskInfo.frame.origin.y + riskInfo.frame.height + gap
        if potentialFireTypes.isEmpty {
            currentYValue = currentYValue + 20
        }
        potentialFireTypes.map { $0.fireType }.forEach {
            let potentialInfo = UILabel(
                frame: CGRect(origin: CGPoint(x: header.frame.origin.x + labelCellWidth, y: currentYValue),
                              size: CGSize(width: infoCellWidth, height: 20)))
            potentialInfo.text = $0.uppercased()
            potentialInfo.font = potentialInfo.font.withSize(15)
            addSubview(potentialInfo)

            currentYValue = currentYValue + 20
        }

        let extinguisherLabel = UILabel(
            frame: CGRect(origin: CGPoint(x: header.frame.origin.x, y: currentYValue + gap),
                          size: CGSize(width: labelCellWidth, height: 20)))
        extinguisherLabel.text = "EXTINGUISHER: "
        extinguisherLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        addSubview(extinguisherLabel)

        let extinguisherInfo = UILabel(
            frame: CGRect(origin: CGPoint(x: header.frame.origin.x + labelCellWidth, y: currentYValue + gap),
                          size: CGSize(width: infoCellWidth, height: 20)))
        extinguisherInfo.text = potentialFireTypes.isEmpty
            ? "WATER"
            : extractExtinguisherType(from: potentialFireTypes[0].extinguishingMethods[0]).uppercased()
        extinguisherInfo.font = riskInfo.font.withSize(15)
        addSubview(extinguisherInfo)

        okButton = UILabel(
            frame: CGRect(origin: CGPoint(x: insets, y: frame.height - insets - 40),
            size: CGSize(width: UIScreen.main.bounds.width - 20 - (2 * insets), height: 40)))
        okButton.text = "OK"
        okButton.textAlignment = .right
        okButton.isUserInteractionEnabled = true
        okButton.font = UIFont.boldSystemFont(ofSize: 20.0)
        addSubview(okButton)

        bindAllGestureRecgonizers()
    }

    func extractExtinguisherType(from input: String) -> String {
        var string = input
        let range = string.index(string.endIndex, offsetBy: -12)..<string.endIndex
        string.removeSubrange(range)
        return string
    }

    required init?(coder: NSCoder) {
        return nil
    }
}

extension InfoWindow {
    func bindAllGestureRecgonizers() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleOkTap(_:)))
        okButton.addGestureRecognizer(tap)
    }

    @objc func handleOkTap(_ recognizer: UITapGestureRecognizer) {
        removeFromSuperview()
    }
}
