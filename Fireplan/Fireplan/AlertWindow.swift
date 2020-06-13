//
//  AlertWindow.swift
//  Fireplan
//
//  Created by Hol Yin Ho on 13/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//
import UIKit

class AlertWindow: UIView {
    private let alertText: String
    private let alertImage: UIImage
    private var okButton: UILabel!

    init(text: String, image: UIImage) {
        alertText = text
        alertImage = image
        let modalOrigin = CGPoint(x: 10, y: (2 * UIScreen.main.bounds.height) / 3)
        let modalSize = CGSize(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height / 3 - 10)
        super.init(frame: CGRect(origin: modalOrigin, size: modalSize))
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        alpha = 0.95
        clipsToBounds = true
        layer.cornerRadius = 10

        let text = UILabel(frame: CGRect(
            origin: CGPoint.zero,
            size: CGSize(width: (2 / 3) * modalSize.width, height: (2 / 3) * modalSize.height)))
        text.text = alertText
        text.textAlignment = .center
        text.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        text.font = UIFont.boldSystemFont(ofSize: 28.0)

        let iconOrigin = CGPoint(x: text.frame.width, y: 0)
        let iconSize = CGSize(width: text.frame.width / 2, height: text.frame.height)
        let icon = UIImageView(frame: CGRect(origin: iconOrigin, size: iconSize))
        icon.image = image

        let okButtonOrigin = CGPoint(x: 0, y: text.frame.height)
        let okButtonSize = CGSize(width: modalSize.width, height: (modalSize.height / 3))
        okButton = UILabel(frame: CGRect(origin: okButtonOrigin, size: okButtonSize))
        okButton.text = "OK"
        okButton.textAlignment = .center
        okButton.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        okButton.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        okButton.font = UIFont.boldSystemFont(ofSize: 20.0)
        okButton.layer.borderWidth = 3
        okButton.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        okButton.isUserInteractionEnabled = true

        addSubview(text)
        addSubview(icon)
        addSubview(okButton)

        bindAllGestureRecognizers()
    }

    required init?(coder: NSCoder) {
        return nil
    }
}

extension AlertWindow {
    func bindAllGestureRecognizers() {
        let okTap = UITapGestureRecognizer(target: self, action: #selector(handleOkTap(_:)))
        okButton.addGestureRecognizer(okTap)
    }

    @objc func handleOkTap(_ recognizer: UITapGestureRecognizer) {
        removeFromSuperview()
    }
}
