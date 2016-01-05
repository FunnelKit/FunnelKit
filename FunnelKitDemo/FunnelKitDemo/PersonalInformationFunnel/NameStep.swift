//
//  NameStep.swift
//  FunnelKitDemo
//
//  Created by Swanros on 1/4/16.
//  Copyright © 2016 Reserbus. All rights reserved.
//

import FunnelKit
import UIKit

class NameStep: FunnelStep {
    init() {
        super.init(viewController: NameStepViewController(), title: "Input Name")
    }
}

class NameStepViewController: PersonalInformationFunnelViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.placeholder = "First Name"
    }
    
    override func textFieldDidUpdate() {
        userCoordinator?.firstName = textField.text
        print(userCoordinator)
    }
}
