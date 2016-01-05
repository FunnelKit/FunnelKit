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
        super.init(viewController: AgeStepViewController())
    }
}

class AgeStepViewController: FunnelStepViewController {
    private var _textField: UITextField?
    private var textField: UITextField {
        if let t = _textField { return t } else {
            _textField = UITextField()
            _textField?.translatesAutoresizingMaskIntoConstraints = false
            _textField?.placeholder = "Age"
            _textField?.keyboardType = .NumberPad
            
            return _textField!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .whiteColor()
        
        view.addSubview(textField)
        textFieldLayout()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        textField.becomeFirstResponder()
    }
    
    private func textFieldLayout() {
        textField.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 90).active = true
        textField.leftAnchor.constraintEqualToAnchor(view.leftAnchor, constant: 10).active = true
        textField.rightAnchor.constraintEqualToAnchor(view.rightAnchor, constant: -10).active = true
        textField.heightAnchor.constraintEqualToConstant(40).active = true
    }
    
    override func nextButtonTapped() {
        (coordinator as? UserBuilderCoordinator)?.age = Int(textField.text!)
        
        super.nextButtonTapped()
    }
}