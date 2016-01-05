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
        super.init(viewController: NameStepViewController())
    }
}

class NameStepViewController: FunnelStepViewController {
    private var _textField: UITextField?
    private var textField: UITextField {
        if let t = _textField { return t } else {
            _textField = UITextField()
            _textField?.translatesAutoresizingMaskIntoConstraints = false
            _textField?.placeholder = "First Name"
            _textField?.addTarget(self, action: "textFieldDidUpdate", forControlEvents: .EditingChanged)
            
            return _textField!
        }
    }
    
    func textFieldDidUpdate() {
        (coordinator as? UserBuilderCoordinator)?.firstName = textField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem?.title = "Input Email"
        
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
}
