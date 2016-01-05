//
//  UserBuilderCoordinator.swift
//  FunnelKitDemo
//
//  Created by Swanros on 1/4/16.
//  Copyright © 2016 Reserbus. All rights reserved.
//

import FunnelKit

class UserBuilderCoordinator: FunnelCompletionCoordinator {
    var firstName: String?
    var email: String?
    var age: Int?
    
    override func generateOutput() -> FunnelCompletionOutput? {
        guard
            let name  = firstName,
            let email = email,
            let age   = age else {
                return nil
        }
        
        return User(name: name, email: email, age: age)
    }
}
