
public protocol FunnelStepBaseDelegate {
    func funnelStepBaseDidComplete(funnelStep: FunnelStepBase)
    func funnelStepBase(funnelStepBase: FunnelStepBase, didFinishWithErrors errors: [NSError])
}
