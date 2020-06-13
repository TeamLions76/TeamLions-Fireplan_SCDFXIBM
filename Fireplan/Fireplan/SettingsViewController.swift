//
//  SettingsViewController.swift
//  Fireplan
//
//  Created by Hol Yin Ho on 13/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//
import UIKit

class SettingsViewController: UIViewController {
    var backButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        let height = UIScreen.main.bounds.height
        let width = UIScreen.main.bounds.width

        let iconSide: CGFloat = 40

        let settingsLabel = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 5), size: CGSize(width: width, height: 40)))
        settingsLabel.text = "SETTINGS"
        settingsLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        settingsLabel.textAlignment = .center
        settingsLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        view.addSubview(settingsLabel)

        backButton = UIButton(
            frame: CGRect(origin: CGPoint(x: 5, y: 10),
                          size: CGSize(width: iconSide, height: iconSide)))
        backButton.setImage(UIImage(named: "Arrow"), for: .normal)
        view.addSubview(backButton)

        let homeBar = SettingsBar(
            origin: CGPoint(x: 20, y: 100),
            image: UIImage(named: "Home"),
            title: "Home", desc: "View live updates")
        view.addSubview(homeBar)

        let floorPlanBar = SettingsBar(
            origin: CGPoint(x: 20, y: 170),
            image: UIImage(named: "Floorplan"),
            title: "Floorplan", desc: "Edit")
        view.addSubview(floorPlanBar)

        let alertBar = SettingsBar(
            origin: CGPoint(x: 20, y: 240),
            image: UIImage(named: "Alert"),
            title: "Alert", desc: "Notifications ON")
        view.addSubview(alertBar)

        let devicesBar = SettingsBar(
            origin: CGPoint(x: 20, y: 310),
            image: UIImage(named: "Devices"),
            title: "Devices", desc: "10 Devices Connected")
        view.addSubview(devicesBar)

        let syncBar = SettingsBar(
            origin: CGPoint(x: 20, y: 380),
            image: UIImage(named: "Sync"),
            title: "Sync Floorplan", desc: "")
        view.addSubview(syncBar)

        let helpBar = SettingsBar(
            origin: CGPoint(x: 20, y: 450),
            image: UIImage(named: "Help"),
            title: "Help", desc: "")
        view.addSubview(helpBar)

        bindGestureRecgonizers()
    }

    func bindGestureRecgonizers() {
        backButton.addTarget(self, action: #selector(segueToHome(_:)), for: .touchUpInside)
    }

    @objc func segueToHome(_ sender: UIButton) {
        performSegue(withIdentifier: "backToHome", sender: sender)
    }
}
