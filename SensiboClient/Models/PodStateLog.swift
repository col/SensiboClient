//
//  PodStateLog.swift
//  SensiboClient
//
//  Created by Colin Harris on 11/2/19.
//  Copyright © 2019 Colin Harris. All rights reserved.
//

import Foundation

public class PodStateLog: Codable {
    let status: String
    let reason: String
    let acState: PodState
    let changedProperties: [String]
    let id: String
    let failureReason: String?
    
    public init(status: String, reason: String, acState: PodState, changedProperties: [String], id: String, failureReason: String?) {
        self.status = status
        self.reason = reason
        self.acState = acState
        self.changedProperties = changedProperties
        self.id = id
        self.failureReason = failureReason
    }
}
