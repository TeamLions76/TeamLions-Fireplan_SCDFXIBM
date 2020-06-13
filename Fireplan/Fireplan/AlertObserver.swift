//
//  AlertObserver.swift
//  Fireplan
//
//  Created by Hol Yin Ho on 13/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

protocol AlertObserver {
    func alertDidClose(alert: AlertWindow, isSendLocation: Bool)
}
