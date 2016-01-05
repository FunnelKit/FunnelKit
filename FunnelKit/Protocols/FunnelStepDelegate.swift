
public protocol FunnelStepDelegate {
    func funnelStepDidComplete(funnelStep: FunnelStep)
    func funnelStep(funnelStep: FunnelStep, didCompleteWithErrors errors: [NSError])
}