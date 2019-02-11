//
//  SetPodStateRequest.swift
//  SensiboClient
//
//  Created by Colin Harris on 11/2/19.
//  Copyright © 2019 Colin Harris. All rights reserved.
//

import Foundation

class SetPodStateRequest: Codable {
    let acState: PodState
    
    init(acState: PodState) {
        self.acState = acState
    }
}
