
public class Funnel: GroupOperation {
    public var steps: [NSOperation]
    
    private var context: UIViewController?
    private var navigationController: UINavigationController?
    
    public init(funnelSteps: [FunnelStep], context: UIViewController? = nil) {
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
        
        guard let nextIndex = steps.indexOf(step)?.successor() where nextIndex < steps.count - 1 else {
            finish()
            return
        }
        
        guard let nextStep = steps[nextIndex] as? FunnelStep else {
            finish()
            return
        }
        
        nextStep.coordinator = step.coordinator
        if nextStep.viewController != nil {
            navigationController?.pushViewController(nextStep.viewController!, animated: true)
        }
    }
}
