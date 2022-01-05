//
//  DetailProductRouter.swift
//  ViolaVIPER
//
//  Created by George on 02.01.2022.
//

import Foundation
import UIKit

class DetailProductRouter: DetailProductRouterInput {
   
    
  weak var rootViewController:UIViewController?
    
    func goBack() {
        rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    func shareProduct(shareItems: [Any]) {
        let activityVC = ActivityModuleAssembly.assembleActivityModule(shareItems: shareItems)
        rootViewController?.navigationController?.present(activityVC, animated: true, completion: nil)
    }
    
    
}
