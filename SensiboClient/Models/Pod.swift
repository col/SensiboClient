//
//  Pod.swift
//  SensiboClient
//
//  Created by Colin Harris on 11/2/19.
//  Copyright © 2019 Colin Harris. All rights reserved.
//

import Foundation

public class Pod: Codable {
    public let id: String
    
    public init(id: String) {
        self.id = id
    }
}
