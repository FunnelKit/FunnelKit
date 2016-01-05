
public class Funnel: GroupOperation {
    public var steps: [NSOperation]
    public var delegate: FunnelDelegate?
    public var coordinator: FunnelCompletionCoordinator?
    
    private var context: UIViewController?
    private var navigationController: UINavigationController?
    
    public init<T: FunnelCompletionCoordinator>(coordinatorType: T.Type, funnelSteps: [FunnelStep], context: UIViewController? = nil) {
        self.context = context ?? UIApplication.sharedApplication().keyWindow?.rootViewController
        
        steps = funnelSteps
        steps.append(NSBlockOperation(block: {}))
        
        for (index, step) in steps.flatMap({$0 as? FunnelStep}).enumerate() {
            if index == 0 {
                step.coordinator = coordinatorType.init()
            } else {
                step.addDependency(funnelSteps[index - 1])
            }
        }
        
        super.init(operations: steps)
    }
    
    public override func finish(errors: [NSError] = []) {
        executeOnMainThread {
            self.context?.dismissViewControllerAnimated(true) {
                self.delegate?.funel(self,
                    didCompleteWithCoordinatorOutput: self.coordinator?.generateOutput(),
                    errors: errors
                )
                super.finish(errors)
            }
        }
    }
    
    public override func execute() {
        super.execute()
        
        guard let root = steps.flatMap({ $0 as? FunnelStep }).first?.viewController else {
            finish()
            return
        }
        
        navigationController = UINavigationController(rootViewController: root)
        context?.presentViewController(navigationController!, animated: true, completion: nil)
    }
    
    public override func operationDidFinish(operation: NSOperation, withErrors errors: [NSError]) {
        guard let step = operation as? FunnelStep where errors.count == 0 else {
            finish(errors)
            return
        }
        
        coordinator = step.coordinator
        
        guard let nextIndex = steps.indexOf(step)?.successor() where nextIndex < steps.count - 1 else {
            finish()
            return
        }
        
        guard let nextStep = steps[nextIndex] as? FunnelStep else {
            finish()
            return
        }
        
        nextStep.coordinator = coordinator
        
        if nextStep.viewController != nil {
            navigationController?.pushViewController(nextStep.viewController!, animated: true)
        }
    }
}
