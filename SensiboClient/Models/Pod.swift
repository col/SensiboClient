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
    public var state: PodState?
    
    public init(id: String, room: Room? = nil, state: PodState? = nil) {
        self.id = id
        self.room = room
        self.state = state
    }
    
    public func name() -> String {
        if let room = self.room {
            return room.name
        }
        return id
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case room
        case state = "acState"
    }
}
