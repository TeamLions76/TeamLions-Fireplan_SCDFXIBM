//
//  ToggleFloorSwitch.swift
//  Fireplan
//
//  Created by Hol Yin Ho on 13/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

import UIKit

class ToggleFloorSwitch: UIView {
    var selectedLevel = 1 {
        didSet {
            if selectedLevel == 1 {
                level1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                level1.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                level2.backgroundColor = nil
                level2.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                level2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                level2.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                level1.backgroundColor = nil
                level1.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
        }
    }
    let level1: UILabel
    let level2: UILabel
    var observer: SwitchObserver?

    init(origin: CGPoint) {
        level1 = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 40, height: 40)))
        level1.text = "1"
        level1.textAlignment = .center
        level1.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        level1.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        level1.layer.borderWidth = 2
        level1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        level1.isUserInteractionEnabled = true

        level2 = UILabel(frame: CGRect(origin: CGPoint(x: 40, y: 0), size: CGSize(width: 40, height: 40)))
        level2.text = "2"
        level2.textAlignment = .center
        level2.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        level2.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        level2.layer.borderWidth = 2
        level2.isUserInteractionEnabled = true

        super.init(frame: CGRect(origin: origin, size: CGSize(width: 80, height: 40)))
        isUserInteractionEnabled = true
        addSubview(level1)
        addSubview(level2)

        bindAllGestureRecognizers()
    }

    required init?(coder: NSCoder) {
        return nil
    }
}

extension ToggleFloorSwitch {
    func selectLevel1() {
        selectedLevel = 1
        observer?.didSelectLevel1()
    }

    func selectLevel2() {
        selectedLevel = 2
        observer?.didSelectLevel2()
    }

    @objc func level1Tap(_ recognizer: UITapGestureRecognizer) {
        selectLevel1()
    }

    @objc func level2Tap(_ recognizer: UITapGestureRecognizer) {
        selectLevel2()
    }

    func bindAllGestureRecognizers() {
        let tapLevel1 = UITapGestureRecognizer(target: self, action: #selector(level1Tap(_:)))
        level1.addGestureRecognizer(tapLevel1)

        let tapLevel2 = UITapGestureRecognizer(target: self, action: #selector(level2Tap(_:)))
        level2.addGestureRecognizer(tapLevel2)
    }
}
