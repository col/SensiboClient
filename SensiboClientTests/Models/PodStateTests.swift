//
//  PodStateTests.swift
//  SensiboClientTests
//
//  Created by Colin Harris on 11/2/19.
//  Copyright © 2019 Colin Harris. All rights reserved.
//

import XCTest
@testable import SensiboClient

class PodStateTests: XCTestCase {
    
    func testDecrypt() {
        let json = "{ \"on\": true, \"fanLevel\": \"medium\", \"temperatureUnit\": \"C\", \"targetTemperature\": 25, \"mode\": \"cool\", \"swing\": \"stopped\" }"
        let podState = try? JSONDecoder().decode(PodState.self, from: json.data(using: .utf8)!)
        XCTAssertNotNil(podState)
        XCTAssertEqual(podState?.on, true)
        XCTAssertEqual(podState?.fanLevel, .medium)
        XCTAssertEqual(podState?.temperatureUnit, .celsius)
        XCTAssertEqual(podState?.targetTemperature, 25)
        XCTAssertEqual(podState?.mode, .cool)
        XCTAssertEqual(podState?.swing, .stopped)
    }
    
    func testFanLevelDisplayString() {
        XCTAssertEqual(FanLevel.quiet.description, "Quiet")
        XCTAssertEqual(FanLevel.low.description, "Low")
        XCTAssertEqual(FanLevel.mediumLow.description, "Medium Low")
        XCTAssertEqual(FanLevel.medium.description, "Medium")
        XCTAssertEqual(FanLevel.mediumHigh.description, "Medium High")
        XCTAssertEqual(FanLevel.high.description, "High")
        XCTAssertEqual(FanLevel.auto.description, "Auto")
    }
    
    func testTemperatureUnitDescription() {
        XCTAssertEqual(TemperatureUnit.celsius.description, "Celsius")
        XCTAssertEqual(TemperatureUnit.fahrenheit.description, "Fahrenheit")
    }
    
    func testACModeDescription() {
        XCTAssertEqual(ACMode.fan.description, "Fan")
        XCTAssertEqual(ACMode.dry.description, "Dry")
        XCTAssertEqual(ACMode.cool.description, "Cool")
        XCTAssertEqual(ACMode.heat.description, "Heat")
        XCTAssertEqual(ACMode.auto.description, "Auto")
    }
    
    func testSwingModeDescription() {
        XCTAssertEqual(SwingMode.stopped.description, "Stopped")
        XCTAssertEqual(SwingMode.fullRange.description, "Full Range")
    }
}

