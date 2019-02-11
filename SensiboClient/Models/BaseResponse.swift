//
//  BaseResponse.swift
//  SensiboClient
//
//  Created by Colin Harris on 11/2/19.
//  Copyright © 2019 Colin Harris. All rights reserved.
//

import Foundation

public class BaseResponse<T: Codable>: Codable {
    let status: String
    let result: T?
    
    public init(status: String, result: T?) {
        self.status = status
        self.result = result
    }
    
    public var isSuccess: Bool {
        return status == "success"
    }
}
