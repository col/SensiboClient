//
//  SensiboClientTests.swift
//  SensiboClientTests
//
//  Created by Colin Harris on 11/2/19.
//  Copyright © 2019 Colin Harris. All rights reserved.
//

import XCTest
@testable import SensiboClient

class SensiboClientTests: XCTestCase {

    var mockSession = MockSession()
    var client: SensiboClient!
    
    override func setUp() {
        client = SensiboClient(apiKey: "...", session: mockSession)
    }

    func testGetPods() {
        mockSession.data = """
            {
                "status": "success",
                "result": [
                    {"id": "asdf", "room": { "name": "Bedroom", "icon": "bedroom" } },
                    {"id": "qwer", "room": { "name": "Lounge Room", "icon": "lounge" }}
                ]
            }
        """.data(using: .utf8)
        mockSession.response = HTTPURLResponse(url: URL(string: "http://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let expectation = XCTestExpectation(description: "callback")
        client.getPods() { pods, error in
            XCTAssertNotNil(pods)
            XCTAssertNil(error)
            XCTAssertEqual(pods?.count, 2)
            XCTAssertEqual(pods?[0].id, "asdf")
            XCTAssertEqual(pods?[0].name(), "Bedroom")
            XCTAssertEqual(pods?[1].id, "qwer")
            XCTAssertEqual(pods?[1].name(), "Lounge Room")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testGetPodState() {
        mockSession.data = """
            {
                \"status\": \"success\",
                \"result\": [
                    {
                        \"status\": \"Success\",
                        \"reason\": \"UserAction\",
                        \"acState\": {
                            \"on\": false,
                            \"fanLevel\": \"quiet\",
                            \"temperatureUnit\": \"C\",
                            \"targetTemperature\": 25,
                            \"mode\": \"cool\",
                            \"swing\": \"stopped\"
                        },
                        \"changedProperties\": [
                            "on"
                        ],
                        \"id\": \"asdf\",
                        \"failureReason\": null
                    }
                ]
            }
        """.data(using: .utf8)
        mockSession.response = HTTPURLResponse(url: URL(string: "http://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let expectation = XCTestExpectation(description: "callback")
        client.getPodState(podId: "asdf") { podState, error in
            XCTAssertNotNil(podState)
            XCTAssertNil(error)
            XCTAssertEqual(podState?.on, false)
            XCTAssertEqual(podState?.fanLevel, .quiet)
            XCTAssertEqual(podState?.temperatureUnit, .celsius)
            XCTAssertEqual(podState?.targetTemperature, 25)
            XCTAssertEqual(podState?.mode, .cool)
            XCTAssertEqual(podState?.swing, .stopped)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
    }
}
