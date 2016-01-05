
public class FunnelStepViewController: UIViewController, FunnelStep {
    public var delegate: FunnelStepDelegate?
    public var coordinator: FunnelCompletionCoordinator?
    
    private var _cancelButton: UIBarButtonItem?
    private var cancelButton: UIBarButtonItem {
        if let c = _cancelButton { return c } else {
            _cancelButton = UIBarButtonItem(title: "Cancel", style: .Done, target: self, action: "cancelButtonTapped")
            
            return _cancelButton!
        }
    }
    
    private var _nextButton: UIBarButtonItem?
    private var nextButton: UIBarButtonItem {
        if let n = _nextButton { return n } else {
            _nextButton = UIBarButtonItem(title: "Next", style: .Done, target: self, action: "nextButtonTapped")
            
            return _nextButton!
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = nextButton
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    public func cancelButtonTapped() {
        let error = ErrorSpecification(ec: OperationError.ExecutionFailed)
        delegate?.funnelStep(self, didFinishWithErrors: [NSError(error: error)])
    }
    
    public func nextButtonTapped() {
        delegate?.funnelStepDidComplete(self)
    }
}
