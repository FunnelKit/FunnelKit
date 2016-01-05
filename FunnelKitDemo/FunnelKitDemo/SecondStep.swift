//
//  SecondStep.swift
//  FunnelKitDemo
//
//  Created by Swanros on 1/4/16.
//  Copyright © 2016 Reserbus. All rights reserved.
//

import FunnelKit

class SecondStep: FunnelStep {
    init() {
        super.init(viewController: SecondStepViewController())
    }
}

class SecondStepViewController: FunnelStepViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .greenColor()
    }
}

