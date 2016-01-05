
public class FunnelStep: Operation {
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

extension FunnelStep: FunnelStepBaseDelegate {
    public func funnelStepBase(funnelStepBase: FunnelStepBase, didFinishWithErrors errors: [NSError]) {
        finish(errors)
    }
    
    public func funnelStepBaseDidComplete(funnelStep: FunnelStepBase) {
        finish()
    }
}
