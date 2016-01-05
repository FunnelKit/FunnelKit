//
//  AgeStep.swift
//  FunnelKitDemo
//
//  Created by Swanros on 1/5/16.
//  Copyright © 2016 Reserbus. All rights reserved.
//

import FunnelKit
import UIKit

class AgeStep: FunnelStep {
    init() {
        super.init(viewController: AgeStepViewController(), title: "Input Age")
    }
}

class AgeStepViewController: PersonalInformationFunnelViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.keyboardType = .NumberPad
        textField.placeholder = "Age"
    }
    
    override func textFieldDidUpdate() {
        userCoordinator?.age = Int(textField.text!)
        print(userCoordinator)
    }
}