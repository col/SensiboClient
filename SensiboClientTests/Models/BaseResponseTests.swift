//
//  BaseResponseTests.swift
//  SensiboClientTests
//
//  Created by Colin Harris on 11/2/19.
//  Copyright © 2019 Colin Harris. All rights reserved.
//

import XCTest
@testable import SensiboClient

class BaseResponseTests: XCTestCase {
    
    func testDecrypt() {
        let json = "{ \"status\": \"success\", \"result\": { \"id\": \"asdf\" } }"
        let response = try? JSONDecoder().decode(BaseResponse<Pod>.self, from: json.data(using: .utf8)!)
        
        XCTAssertNotNil(response)
        XCTAssertEqual(response!.status, "success")
        XCTAssertEqual(response!.isSuccess, true)
        
        XCTAssertNotNil(response!.result)
        XCTAssertEqual(response!.result!.id, "asdf")
    }
}
