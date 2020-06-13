//
//  LandingViewController.swift
//  Fireplan
//
//  Created by Hol Yin Ho on 13/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    var allFireTypes: [FireType] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        let iconSide = UIScreen.main.bounds.width / 2

        let icon = UIImageView(frame: CGRect(
            origin: CGPoint(x: UIScreen.main.bounds.width / 4, y: (UIScreen.main.bounds.height / 2) - (iconSide / 2)),
            size: CGSize(width: iconSide, height: iconSide)))
        icon.image = UIImage(named: "FireplanLogo")
        view.addSubview(icon)

        let loadingBar = LoadingBar(frame: CGRect(
            origin: CGPoint(x: UIScreen.main.bounds.width / 4, y: icon.frame.origin.y + iconSide + 10),
            size: CGSize(width: iconSide, height: 10)))
        view.addSubview(loadingBar)

        Database().readDB(callback: addFireTypes(_:))
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let floorPlanViewController = segue.destination as? FloorPlanViewController else {
            return
        }
        floorPlanViewController.allFireTypes = allFireTypes
    }

    func segueToSettings() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.performSegue(withIdentifier: "toHome", sender: self)
        })
    }

    func addFireTypes(_ fireTypes: [FireType]) {
        allFireTypes = fireTypes
        segueToSettings()
    }
}
