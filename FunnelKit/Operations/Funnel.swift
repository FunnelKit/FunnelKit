
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
        
        super.init(operations: steps)
        
        for (index, step) in steps.flatMap({$0 as? FunnelStep}).enumerate() {
            if index == 0 {
                step.coordinator = coordinatorType.init()
            } else {
                step.addDependency(steps[index - 1])
            }
            
            guard let nextStep = getNextStep(currentStep: step) else {
                step.viewController?.setRightButtonTitle(newTitle: "Finish")
                continue
            }
            
            step.viewController?.setRightButtonTitle(newTitle: nextStep.title)
        }
    }
    
    public override func finish(errors: [NSError] = []) {
        executeOnMainThread {
            self.context?.dismissViewControllerAnimated(true) {
                self.delegate?.funnel(self,
                    didCompleteWithCoordinatorOutput: self.coordinator?.generateOutput(),
                    errors: errors
                )
                super.finish(errors)
            }
        }
    }
    
    public override func execute() {
        super.execute()
        
        guard
            let firstStep = steps.flatMap({$0 as? FunnelStep }).first,
            let root = firstStep.viewController
            else {
                finish()
                return
        }
        
        navigationController = UINavigationController(rootViewController: root)
        context?.presentViewController(navigationController!, animated: true, completion:nil)
        
        delegate?.funnel(self, didStartStep: firstStep)
    }
    
    public override func operationDidFinish(operation: NSOperation, withErrors errors: [NSError]) {
        guard let step = operation as? FunnelStep where errors.count == 0 else {
            finish(errors)
            return
        }
        
        delegate?.funnel(self, didCompleteStep: step)
        coordinator = step.coordinator
        
        guard let nextStep = getNextStep(currentStep: step) else {
            finish()
            return
        }
        
        if nextStep.viewController != nil {
            navigationController?.pushViewController(nextStep.viewController!, animated: true)
            delegate?.funnel(self, didStartStep: nextStep)
        } else {
            finish()
        }
    }
}

extension Funnel {
    private func getNextStep(currentStep step: FunnelStep) -> FunnelStep? {
        guard let nextIndex = steps.indexOf(step)?.successor() where nextIndex < steps.count - 1 else {
            return nil
        }
        
        guard let nextStep = steps[nextIndex] as? FunnelStep else {
            return nil
        }
        
        return nextStep
    }
}