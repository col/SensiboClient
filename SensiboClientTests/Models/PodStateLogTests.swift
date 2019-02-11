//
//  PodStateLogTests.swift
//  SensiboClientTests
//
//  Created by Colin Harris on 11/2/19.
//  Copyright © 2019 Colin Harris. All rights reserved.
//

import XCTest
@testable import SensiboClient

class PodStateLogTests: XCTestCase {
    
    func testDecrypt() {
        let json = "{ \"status\": \"Success\", \"reason\": \"UserRequest\", \"acState\": { \"on\": true, \"fanLevel\": \"medium\", \"temperatureUnit\": \"C\", \"targetTemperature\": 25, \"mode\": \"cool\", \"swing\": \"stopped\" }, \"changedProperties\": [\"on\"], \"id\": \"asdf\", \"failureReason\": null }"
        let podStateLog = try? JSONDecoder().decode(PodStateLog.self, from: json.data(using: .utf8)!)
        XCTAssertNotNil(podStateLog)
        XCTAssertEqual(podStateLog?.status, "Success")
        XCTAssertEqual(podStateLog?.reason, "UserRequest")
        XCTAssertEqual(podStateLog?.changedProperties, ["on"])
        XCTAssertEqual(podStateLog?.id, "asdf")
        XCTAssertNil(podStateLog?.failureReason)
        
        XCTAssertEqual(podStateLog?.acState.on, true)
        XCTAssertEqual(podStateLog?.acState.fanLevel, .medium)
        XCTAssertEqual(podStateLog?.acState.temperatureUnit, .celsius)
        XCTAssertEqual(podStateLog?.acState.targetTemperature, 25)
        XCTAssertEqual(podStateLog?.acState.mode, .cool)
        XCTAssertEqual(podStateLog?.acState.swing, .stopped)
    }
    
}
