//
//  EmailStep.swift
//  FunnelKitDemo
//
//  Created by Swanros on 1/5/16.
//  Copyright © 2016 Reserbus. All rights reserved.
//

import FunnelKit
import UIKit

class EmailStep: FunnelStep {
    init() {
        super.init(viewController: EmailStepViewController(), title: "Input Email")
    }
}

class EmailStepViewController: PersonalInformationFunnelViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.placeholder = "Email"
    }
    
    override func textFieldDidUpdate() {
        userCoordinator?.email = textField.text
        print(userCoordinator)
    }
}
