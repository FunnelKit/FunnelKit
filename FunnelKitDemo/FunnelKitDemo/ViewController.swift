//
//  ViewController.swift
//  FunnelKitDemo
//
//  Created by Swanros on 1/4/16.
//  Copyright © 2016 Reserbus. All rights reserved.
//

import UIKit
import FunnelKit
import PFoundation

class ViewController: UIViewController {
    
    let queue = OperationQueue()
    
    private var _button: UIButton?
    private var button: UIButton {
        if let b = _button { return b } else {
            _button = UIButton()
            _button?.translatesAutoresizingMaskIntoConstraints = false
            _button?.setTitle("Init", forState: .Normal)
            _button?.setTitleColor(.redColor(), forState: .Normal)
            _button?.addTarget(self, action: "buttonTapped", forControlEvents: .TouchUpInside)
            
            return _button!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        
        button.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        button.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
    }
    
    func buttonTapped() {
        let funnel = MainFunnel(context: self)
        funnel.addObserver(Observer())
        
        queue.addOperation(funnel)
    }
}

struct Observer: OperationObserver {
    func operation(operation: Operation, didProduceOperation newOperation: NSOperation) {
        print("produce")
    }
    
    func operationDidFinish(operation: Operation, errors: [NSError]) {
        print("finish")
    }
    
    func operationDidStart(operation: Operation) {
        print("start")
    }
}