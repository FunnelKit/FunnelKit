//
//  User.swift
//  FunnelKitDemo
//
//  Created by Swanros on 1/5/16.
//  Copyright © 2016 Reserbus. All rights reserved.
//

import FunnelKit

struct User: FunnelCompletionOutput {
    let name: String
    let email: String
    let age: Int
    
    init(name: String, email: String, age: Int) {
        self.name  = name
        self.email = email
        self.age   = age
    }
}

extension User: CustomStringConvertible {
    var description: String {
        return "\(self.dynamicType): {\n\tName: \(name)\n\tEmail: \(email)\n\tAge: \(age)\n}"
    }
}