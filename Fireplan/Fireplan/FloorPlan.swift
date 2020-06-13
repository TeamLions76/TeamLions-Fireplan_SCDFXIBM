//
//  FloorPlan.swift
//  Fireplan
//
//  Created by Hol Yin Ho on 12/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

import UIKit

class FloorPlan: UIView {
    static let backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = FloorPlan.backgroundColor
        let height = UIScreen.main.bounds.height
        let width = UIScreen.main.bounds.width
        
        
    }

    required init?(coder: NSCoder) {
        nil
    }
}
