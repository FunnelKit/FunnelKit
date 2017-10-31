//
//  Funnel.swift
//  FunnelKit
//
//  Created by Oscar Swanros on 10/31/17.
//  Copyright © 2017 FunnelKit. All rights reserved.
//

public class Funnel {
    public var steps: [FunnelStep]
    public var delegate: FunnelStepDelegate?
    
    public init(
        steps: [FunnelStep],
        delegate: FunnelStepDelegate? = nil) {
        self.steps = steps
        self.delegate = delegate
    }
}

public protocol FunnelDelegate {
    func funnel(funnel: Funnel, didStartStep step: FunnelStep)
    func funnel(funnel: Funnel, didCompleteStep step: FunnelStep)
    func funnel(funnel: Funnel, didCompleteWithCoordinatorOutput output: FunnelOutput?, errors: [Error])
}
