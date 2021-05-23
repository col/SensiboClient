//
//  PodState.swift
//  SensiboClient
//
//  Created by Colin Harris on 11/2/19.
//  Copyright © 2019 Colin Harris. All rights reserved.
//

import Foundation

public enum FanLevel: String, Codable, CustomStringConvertible, CaseIterable {
    case quiet = "quiet"
    case low = "low"
    case mediumLow = "medium_low"
    case medium = "medium"
    case mediumHigh = "medium_high"
    case high = "high"
    case auto = "auto"
    
    public var description: String {
        switch self {
        case .quiet:
            return "Quiet"
        case .low:
            return "Low"
        case .mediumLow:
            return "Medium Low"
        case .medium:
            return "Medium"
        case .mediumHigh:
            return "Medium High"
        case .high:
            return "High"
        case .auto:
            return "Auto"
        }
    }
}

public enum TemperatureUnit: String, Codable, CustomStringConvertible, CaseIterable {
    case celsius = "C"
    case fahrenheit = "F"
    
    public var description: String {
        switch self {
        case .celsius:
            return "Celsius"
        case .fahrenheit:
            return "Fahrenheit"
        }
    }
}

public enum ACMode: String, Codable, CustomStringConvertible, CaseIterable {
    case dry = "dry"
    case cool = "cool"
    case fan = "fan"
    case heat = "heat"
    case auto = "auto"
    
    public var description: String {
        switch self {
        case .dry:
            return "Dry"
        case .cool:
            return "Cool"
        case .fan:
            return "Fan"
        case .heat:
            return "Heat"
        case .auto:
            return "Auto"
        }
    }
}

public enum SwingMode: String, Codable, CustomStringConvertible, CaseIterable {
    case stopped = "stopped"
    case fullRange = "rangeFull"
    case fixedMiddleTop = "fixedMiddleTop"
    
    public var description: String {
        switch self {
        case .stopped:
            return "Stopped"
        case .fullRange:
            return "Full Range"
        case .fixedMiddleTop:
            return "Fixed Middle Top"
        }
    }
}

public class PodState: Codable {
    public var on: Bool
    public var fanLevel: FanLevel
    public var temperatureUnit: TemperatureUnit
    public var targetTemperature: Int
    public var mode: ACMode
    public var swing: SwingMode
    
    public init(on: Bool, fanLevel: FanLevel, temperatureUnit: TemperatureUnit, targetTemperature: Int, mode: ACMode, swing: SwingMode) {
        self.on = on
        self.fanLevel = fanLevel
        self.temperatureUnit = temperatureUnit
        self.targetTemperature = targetTemperature
        self.mode = mode
        self.swing = swing
    }
}
