
public protocol FunnelDelegate {
    func funel(funnel: Funnel, didCompleteWithCoordinatorOutput output: FunnelCompletionOutput?, errors: [NSError])
}
