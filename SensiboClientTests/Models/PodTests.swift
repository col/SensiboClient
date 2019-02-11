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
}
