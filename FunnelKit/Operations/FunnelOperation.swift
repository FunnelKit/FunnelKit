
public class FunnelOperation: GroupOperation {
    public let context: UIViewController?
    public var steps: [NSOperation]
    
    private var navigationController: UINavigationController?
    
    public init(context: UIViewController? = nil, funnelSteps: [FunnelStepOperation]) {
        self.context = context ?? UIApplication.sharedApplication().keyWindow?.rootViewController
        
        steps = funnelSteps
        steps.append(NSBlockOperation(block: {}))
        
        for (index, step) in steps.enumerate() where step !== steps.first! {
            step.addDependency(funnelSteps[index - 1])
        }
        
        super.init(operations: steps)
    }
    
    public override func finish(errors: [NSError] = []) {
        executeOnMainThread {
            self.context?.dismissViewControllerAnimated(true, completion: { super.finish(errors) })
        }
    }
    
    public override func execute() {
        super.execute()
        
        guard let root = steps.flatMap({ $0 as? FunnelStepOperation }).first?.viewController else {
            finish()
            return
        }
        
        navigationController = UINavigationController(rootViewController: root)
        context?.presentViewController(navigationController!, animated: true, completion: nil)
    }
    
    public override func operationDidFinish(operation: NSOperation, withErrors errors: [NSError]) {
        guard let step = operation as? FunnelStepOperation where errors.count == 0 else {
            finish(errors)
            return
        }
        
        guard let nextIndex = steps.indexOf(step)?.successor() where nextIndex < steps.count - 1 else {
            finish()
            return
        }
        
        guard let nextStep = steps[nextIndex] as? FunnelStepOperation else {
            finish()
            return
        }
        
        nextStep.coordinator = step.coordinator
        if nextStep.viewController != nil {
            navigationController?.pushViewController(nextStep.viewController!, animated: true)
        }
    }
}
