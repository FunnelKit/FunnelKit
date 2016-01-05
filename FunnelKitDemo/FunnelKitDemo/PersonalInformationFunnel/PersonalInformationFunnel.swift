//
//  PersonalInformationFunnel.swift
//  FunnelKitDemo
//
//  Created by Swanros on 1/4/16.
//  Copyright © 2016 Reserbus. All rights reserved.
//

import FunnelKit
import UIKit

class PersonalInformationFunnel: Funnel {
    init(context: UIViewController) {
        super.init(
            coordinatorType: UserBuilderCoordinator.self,
            funnelSteps: [
                NameStep(),
                EmailStep(),
                AgeStep()
            ],
            context: context
        )
    }
}
