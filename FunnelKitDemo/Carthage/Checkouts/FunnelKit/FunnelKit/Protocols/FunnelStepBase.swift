
public protocol FunnelStepBase {
    var coordinator: FunnelCompletionCoordinator? { get set }
    var delegate: FunnelStepBaseDelegate? { get set }
}