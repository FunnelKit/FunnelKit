//
//  FirstStep.swift
//  FunnelKitDemo
//
//  Created by Swanros on 1/4/16.
//  Copyright © 2016 Reserbus. All rights reserved.
//

import FunnelKit

class FirstStep: FunnelStep {
    init() {
        super.init(viewController: FirstStepViewController())
    }
}

class FirstStepViewController: FunnelStepViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .redColor()
    }
}
