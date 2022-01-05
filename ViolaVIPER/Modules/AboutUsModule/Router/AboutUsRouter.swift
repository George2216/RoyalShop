//
//  AboutUsRouter.swift
//  ViolaVIPER
//
//  Created by George on 04.01.2022.
//

import Foundation
import UIKit

class AboutUsRouter:AboutUsRouterInput {
    
    weak var rootViewController:UIViewController?
    
    func goBack() {
        rootViewController?.navigationController?.popViewController(animated: true)
    }
    
    
}
