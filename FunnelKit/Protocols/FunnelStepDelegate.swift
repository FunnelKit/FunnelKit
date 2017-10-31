//
//  FunnelStepDelegate.swift
//  FunnelKit
//
//  Created by Oscar Swanros on 10/31/17.
//  Copyright © 2017 FunnelKit. All rights reserved.
//

public protocol FunnelStepDelegate {
    func funnelStepBaseDidFinish(step: FunnelStep)
    func funnelStepBaseDidFinish(step: FunnelStep, withErrors errors: [Error])
}
