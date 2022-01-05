//
//  ActivityModuleAssembly.swift
//  ViolaVIPER
//
//  Created by George on 04.01.2022.
//

import Foundation
import UIKit

class ActivityModuleAssembly {
    static func assembleActivityModule(shareItems:[Any]) -> UIViewController {
        let view = ActivityVC(activityItems: shareItems, applicationActivities: nil)
        return view
    }
    
}
