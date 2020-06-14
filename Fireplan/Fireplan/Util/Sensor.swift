//
//  Sensor.swift
//  Fireplan
//
//  Created by Hol Yin Ho on 14/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//
import Foundation

class Sensor {
    var observer: SensorObserver
    // High fire, low no fire
    private var temperature: Double

    // High no fire, low fire in units of 10^-10 amperes (Normal value is above 2)
    private var ionizedCurrent: Double

    // High fire, low no fire in units of ppm (Normal value is less than 0.2)
    private var coConcentration: Double

    private var isTempOfBigFire: Bool {
        temperature > 49.9
    }

    private var isTempOfMediumFire: Bool {
        temperature > 49.7
    }

    private var isTempOfSmallFire: Bool {
        temperature > 49
    }

    private var isIonizedCurrentOfBigFire: Bool {
        ionizedCurrent < 1.91
    }

    private var isIonizedCurrentOfMediumFire: Bool {
        ionizedCurrent < 1.93
    }

    private var isIonizedCurrentOfSmallFire: Bool {
        ionizedCurrent < 2
    }

    private var isCoConcentrationOfBigFire: Bool {
        coConcentration > 0.209
    }

    private var isCoConcentrationOfMediumFire: Bool {
        coConcentration > 0.207
    }

    private var isCoConcentrationOfSmallFire: Bool {
        coConcentration > 0.2
    }

    init(observer: SensorObserver) {
        self.observer = observer
        temperature = Double.random(in: 0..<50.0)
        ionizedCurrent = Double.random(in: 1.9..<10.0)
        coConcentration = Double.random(in: -1.0..<0.21)
        Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { timer in
            self.refreshReadings()
        }
    }

    func refreshReadings() {
        temperature = Double.random(in: 0..<50.0)
        ionizedCurrent = Double.random(in: 1.9..<10.0)
        coConcentration = Double.random(in: -1.0..<0.21)
        var fireSize: FireSize?
        if isTempOfBigFire || isIonizedCurrentOfBigFire || isCoConcentrationOfBigFire {
            fireSize = .large
        } else if isTempOfMediumFire || isIonizedCurrentOfMediumFire || isCoConcentrationOfMediumFire {
            fireSize = .medium
        } else if isTempOfSmallFire || isIonizedCurrentOfSmallFire || isCoConcentrationOfSmallFire {
            fireSize = .small
        }
        if let actualFireSize = fireSize {
            observer.fireWasDetected(fireSize: actualFireSize)
        }
    }
}
