
import UIKit
import FunnelKit

class ViewController: UIViewController {
    
    let queue = OperationQueue()
    
    private var _button: UIButton?
    private var button: UIButton {
        if let b = _button { return b } else {
            _button = UIButton()
            _button?.translatesAutoresizingMaskIntoConstraints = false
            _button?.setTitle("Start User Information Funnel", forState: .Normal)
            _button?.setTitleColor(.blueColor(), forState: .Normal)
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
        let funnel = PersonalInformationFunnel(context: self)
        funnel.delegate = self
        
        queue.addOperation(funnel)
    }
}

extension ViewController: FunnelDelegate {
    func funnel(funnel: Funnel, didCompleteWithCoordinatorOutput output: FunnelCompletionOutput?, errors: [NSError]) {
        print("Completed funnel with output:\n\(output!)")
    }
    
    func funnel(funnel: Funnel, didCompleteStep step: FunnelStep) {
        print("Completed \(step) step.")
    }
    
    func funnel(funnel: Funnel, didStartStep step: FunnelStep) {
        print("Starting \(step) step.")
    }
}
