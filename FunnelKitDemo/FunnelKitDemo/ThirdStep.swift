//
//  ThirdStep.swift
//  FunnelKitDemo
//
//  Created by Swanros on 1/4/16.
//  Copyright © 2016 Reserbus. All rights reserved.
//

import FunnelKit

class ThirdStep: FunnelStep {
    init() {
        super.init(viewController: ThirdStepViewController())
    }
}

class ThirdStepViewController: FunnelStepViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellowColor()
    }
}
