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

    init(room: Room, potentialFireTypes: [FireType]) {
        super.init(frame: CGRect(
            origin: CGPoint(x: 10, y: UIScreen.main.bounds.height / 4),
            size: CGSize(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height / 2)
        ))
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

        let header = UILabel(
            frame: CGRect(origin: CGPoint(x: insets, y: insets),
            size: CGSize(width: UIScreen.main.bounds.width - 20 - (2 * insets), height: 30)))
        header.text = "ROOM ASSESMENT"
        header.font = UIFont.boldSystemFont(ofSize: 20.0)

        addSubview(header)
    }

    required init?(coder: NSCoder) {
        return nil
    }
}
