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
    private let alertImage: UIImage?
    private var okButton: UILabel?
    private var okEvacuateButton: UILabel?
    private var sendLocationButton: UILabel?
    var observer: AlertObserver?

    init(text: String, image: UIImage?, isEvacuate: Bool) {
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

        if isEvacuate {
            let sendLocationOrigin = CGPoint(x: -2, y: text.frame.height)
            let sendLocationSize = CGSize(width: modalSize.width / 2 + 2, height: (modalSize.height / 3) + 2)
            let button = UILabel(frame: CGRect(origin: sendLocationOrigin, size: sendLocationSize))
            button.text = "SEND LOCATION"
            button.textAlignment = .center
            button.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            button.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button.font = UIFont.boldSystemFont(ofSize: 20.0)
            button.layer.borderWidth = 1
            button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button.isUserInteractionEnabled = true
            addSubview(button)
            sendLocationButton = button

            let okButtonOrigin = CGPoint(x: modalSize.width / 2, y: text.frame.height)
            let okButtonSize = CGSize(width: modalSize.width / 2 + 2, height: (modalSize.height / 3) + 2)
            let ok = UILabel(frame: CGRect(origin: okButtonOrigin, size: okButtonSize))
            ok.text = "OK"
            ok.textAlignment = .center
            ok.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            ok.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            ok.font = UIFont.boldSystemFont(ofSize: 20.0)
            ok.layer.borderWidth = 1
            ok.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            ok.isUserInteractionEnabled = true
            addSubview(ok)
            okEvacuateButton = ok
        } else {
            let okButtonOrigin = CGPoint(x: 0, y: text.frame.height)
            let okButtonSize = CGSize(width: modalSize.width, height: (modalSize.height / 3))
            let ok = UILabel(frame: CGRect(origin: okButtonOrigin, size: okButtonSize))
            ok.text = "OK"
            ok.textAlignment = .center
            ok.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            ok.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            ok.font = UIFont.boldSystemFont(ofSize: 20.0)
            ok.isUserInteractionEnabled = true
            addSubview(ok)
            okButton = ok
        }

        addSubview(text)
        addSubview(icon)

        bindAllGestureRecognizers()
    }

    required init?(coder: NSCoder) {
        return nil
    }
}

extension AlertWindow {
    func bindAllGestureRecognizers() {
        let okTap = UITapGestureRecognizer(target: self, action: #selector(handleOkTap(_:)))
        okButton?.addGestureRecognizer(okTap)

        let evacuateOkTap = UITapGestureRecognizer(target: self, action: #selector(handleEvacuateOkTap(_:)))
        okEvacuateButton?.addGestureRecognizer(evacuateOkTap)

        let sendLocationTap = UITapGestureRecognizer(target: self, action: #selector(handleSendLocationTap(_:)))
        sendLocationButton?.addGestureRecognizer(sendLocationTap)
    }

    @objc func handleOkTap(_ recognizer: UITapGestureRecognizer) {
        removeFromSuperview()
    }

    @objc func handleEvacuateOkTap(_ recognizer: UITapGestureRecognizer) {
        observer?.alertDidClose(alert: self, isSendLocation: false)
        removeFromSuperview()
    }

    @objc func handleSendLocationTap(_ recognizer: UITapGestureRecognizer) {
        observer?.alertDidClose(alert: self, isSendLocation: true)
        removeFromSuperview()
    }
}
