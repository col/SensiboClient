//
//  PodState.swift
//  SensiboClient
//
//  Created by Colin Harris on 11/2/19.
//  Copyright © 2019 Colin Harris. All rights reserved.
//

import Foundation

public enum FanLevel: String, Codable {
    case quiet = "quiet"
    case low = "low"
    case mediumLow = "medium_low"
    case medium = "medium"
    case mediumHigh = "medium_high"
    case high = "high"
    case auto = "auto"
}

public enum TemperatureUnit: String, Codable {
    case celsius = "C"
    case fahrenheit = "F"
}

public enum ACMode: String, Codable {
    case dry = "dry"
    case cool = "cool"
    case fan = "fan"
    case heat = "heat"
    case auto = "auto"
}

public enum SwingMode: String, Codable {
    case stopped = "stopped"
    case fullRange = "rangeFull"
}

public class PodState: Codable {
    public let on: Bool
    public let fanLevel: FanLevel
    public let temperatureUnit: TemperatureUnit
    public let targetTemperature: Int
    public let mode: ACMode
    public let swing: SwingMode
    
    public init(on: Bool, fanLevel: FanLevel, temperatureUnit: TemperatureUnit, targetTemperature: Int, mode: ACMode, swing: SwingMode) {
        self.on = on
        self.fanLevel = fanLevel
        self.temperatureUnit = temperatureUnit
        self.targetTemperature = targetTemperature
        self.mode = mode
        self.swing = swing
    }
}
