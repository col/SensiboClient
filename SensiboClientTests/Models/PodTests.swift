//
//  PodTests.swift
//  SensiboClientTests
//
//  Created by Colin Harris on 11/2/19.
//  Copyright © 2019 Colin Harris. All rights reserved.
//

import XCTest
@testable import SensiboClient

class PodTests: XCTestCase {
    
    func testDecrypt() {
        let json = "{ \"id\": \"asdf\" }"
        let pod = try? JSONDecoder().decode(Pod.self, from: json.data(using: .utf8)!)
        XCTAssertNotNil(pod)
        XCTAssertEqual(pod?.id, "asdf")
    }
    
    func testDecryptWithRoom() {
        let json = "{ \"id\": \"asdf\", \"room\": { \"name\": \"Bedroom\", \"icon\": \"bedroom\" } }"
        let pod = try? JSONDecoder().decode(Pod.self, from: json.data(using: .utf8)!)
        XCTAssertNotNil(pod)
        XCTAssertEqual(pod?.id, "asdf")
        XCTAssertEqual(pod?.room?.name, "Bedroom")
        XCTAssertEqual(pod?.room?.icon, "bedroom")
    }
    
    func testNameWithoutRoomReturnsId() {
        let pod = Pod(id: "asdf")
        XCTAssertEqual(pod.name(), "asdf")
    }
    
    func testNameWithRoomReturnsRoomName() {
        let pod = Pod(id: "asdf", room: Room(name: "Bedroom", icon: "bedroom"))
        XCTAssertEqual(pod.name(), "Bedroom")
    }
}
