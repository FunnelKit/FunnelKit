//
//  Funnel.swift
//  FunnelKitDemo
//
//  Created by Swanros on 1/4/16.
//  Copyright © 2016 Reserbus. All rights reserved.
//

import FunnelKit

class MainFunnel: FunnelOperation {
    init(context: UIViewController) {
        super.init(funnelSteps: [FirstStep(), SecondStep(), ThirdStep()], context: context)
    }
}
