
public class FunnelCompletionCoordinator {
    required public init() {}
    
    public func generateOutput() -> FunnelCompletionOutput? {
        fatalError("must subclass coordinator!")
    }
}