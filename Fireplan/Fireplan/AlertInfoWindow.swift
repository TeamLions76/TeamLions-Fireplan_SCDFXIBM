//
//  AlertInfoWindow.swift
//  Fireplan
//
//  Created by Hol Yin Ho on 13/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

import UIKit

class AlertInfoWindow: UIView {
    let insets: CGFloat = 25
    var okButton: UILabel!

    init(isSendLocation: Bool) {
        super.init(frame: CGRect(
            origin: CGPoint(x: 10, y: UIScreen.main.bounds.height / 4),
            size: CGSize(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height / 2)
        ))
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.cornerRadius = 10
        alpha = 0.95

        let informedLabel = UILabel(
            frame: CGRect(origin: CGPoint(x: insets, y: insets),
                          size: CGSize(width: UIScreen.main.bounds.width - 20 - (2 * insets), height: 100)))
        informedLabel.text = "SCDF has been informed on your behalf."
        informedLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        informedLabel.numberOfLines = 0
        informedLabel.lineBreakMode = .byWordWrapping
        addSubview(informedLabel)

        if isSendLocation {
            let sendLocationLabel = UILabel(
                frame: CGRect(origin: CGPoint(x: insets, y: insets + 100),
                              size: CGSize(width: UIScreen.main.bounds.width - 20 - (2 * insets), height: 100)))
            sendLocationLabel.text = "Your location has been sent to your family members."
            sendLocationLabel.font = sendLocationLabel.font.withSize(15)
            sendLocationLabel.numberOfLines = 0
            sendLocationLabel.lineBreakMode = .byWordWrapping
            addSubview(sendLocationLabel)
        }
        
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

    required init?(coder: NSCoder) {
        return nil
    }
}

extension AlertInfoWindow {
    func bindAllGestureRecgonizers() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleOkTap(_:)))
        okButton.addGestureRecognizer(tap)
    }

    @objc func handleOkTap(_ recognizer: UITapGestureRecognizer) {
        removeFromSuperview()
    }
}
