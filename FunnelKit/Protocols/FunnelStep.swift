//
//  FunnelStep.swift
//  FunnelKit
//
//  Created by Oscar Swanros on 10/31/17.
//  Copyright © 2017 FunnelKit. All rights reserved.
//

public protocol FunnelStep {
    var coordinator: FunnelCompletionCoordinator { get set }
    var delegate: FunnelStepDelegate { get set }
}

public class FunnelCompletionCoordinator {
    required public init() {}
    
    open func generateOutput() -> FunnelOutput? {
        fatalError("This must be subclassed.")
    }
}


