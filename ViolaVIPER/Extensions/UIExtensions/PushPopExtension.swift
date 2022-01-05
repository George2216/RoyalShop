//
//  PushPopExtension.swift
//  ViolaVIPER
//
//  Created by George on 04.01.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func pushUp(_ controller:UIViewController) {
        let transition = CATransition()
          transition.duration = 0.5
          transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
          transition.type = CATransitionType.moveIn
          transition.subtype = CATransitionSubtype.fromTop
          self.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(controller, animated: false)
    }
    
    func popDown() {
        let transition:CATransition = CATransition()
             transition.duration = 0.5
             transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
             transition.type = CATransitionType.reveal
             transition.subtype = CATransitionSubtype.fromBottom
             self.navigationController?.view.layer.add(transition, forKey: kCATransition)
             self.navigationController?.popViewController(animated: false)
    }
}

