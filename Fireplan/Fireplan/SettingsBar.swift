//
//  SettingsBar.swift
//  Fireplan
//
//  Created by Hol Yin Ho on 13/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//
import UIKit

class SettingsBar: UIView {
    init(origin: CGPoint, image: UIImage?, title: String, desc: String) {
        let insets: CGFloat = 10
        let barSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 50)
        super.init(frame: CGRect(origin: origin, size: barSize))
        layer.borderWidth = 2
        layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

        let icon = UIImageView(frame: CGRect(origin: CGPoint(x: insets, y: insets), size: CGSize(width: 30, height: 30)))
        icon.image = image
        addSubview(icon)

        let titleLabel = UILabel(frame: CGRect(
            origin: CGPoint(x: 30 + (insets * 2), y: insets),
            size: CGSize(width: barSize.width * 0.35, height: 30)))
        titleLabel.text = title
        titleLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        addSubview(titleLabel)

        let descLabel = UILabel(frame: CGRect(
            origin: CGPoint(x: 30 + titleLabel.frame.width + insets, y: insets),
            size: CGSize(width: frame.width - 30 - titleLabel.frame.width - (2 * insets), height: 30)))
        descLabel.text = desc
        descLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        descLabel.font = descLabel.font.withSize(15)
        descLabel.textAlignment = .right
        addSubview(descLabel)
    }

    required init?(coder: NSCoder) {
        nil
    }
}
