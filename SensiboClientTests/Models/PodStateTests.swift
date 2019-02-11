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
}

