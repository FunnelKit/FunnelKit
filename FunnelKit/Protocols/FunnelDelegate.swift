
public protocol FunnelDelegate {
    func funnel(funnel: Funnel, didStartStep step: FunnelStep)
    func funnel(funnel: Funnel, didCompleteStep step: FunnelStep)
    func funel(funnel: Funnel, didCompleteWithCoordinatorOutput output: FunnelCompletionOutput?, errors: [NSError])
}
