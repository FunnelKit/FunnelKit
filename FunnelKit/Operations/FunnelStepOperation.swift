
public class FunnelStepOperation: Operation {
    public let viewController: FunnelStepViewController?
    var coordinator: FunnelCompletionCoordinator? {
        get {
            return viewController?.coordinator
        }
        
        set {
            viewController?.coordinator = newValue
        }
    }
    
    public init(viewController: FunnelStepViewController) {
        self.viewController = viewController
    }
    
    public override func execute() {
        guard let viewController = viewController else {
            finish()
            
            return
        }
        
        viewController.delegate = self
    }
}

extension FunnelStepOperation: FunnelStepDelegate {
    public func funnelStep(funnelStep: FunnelStep, didFinishWithErrors errors: [NSError]) {
        finish(errors)
    }
    
    public func funnelStepDidComplete(funnelStep: FunnelStep) {
        finish()
    }
}
