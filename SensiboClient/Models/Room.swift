//
//  Room.swift
//  SensiboClient
//
//  Created by Colin Harris on 16/6/19.
//  Copyright © 2019 Colin Harris. All rights reserved.
//

import Foundation

public class Room: Codable {
    public let name: String
    public let icon: String
    
    public init(name: String, icon: String) {
        self.name = name
        self.icon = icon
    }
}
