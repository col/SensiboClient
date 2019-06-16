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
    public let room: Room?
    
    public init(id: String, room: Room? = nil) {
        self.id = id
        self.room = room
    }
    
    public func name() -> String {
        if let room = self.room {
            return room.name
        }
        return id
    }
}
