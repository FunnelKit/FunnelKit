
public protocol FunnelStep {
    var coordinator: FunnelCompletionCoordinator? { get set }
    var delegate: FunnelStepDelegate? { get set }
}