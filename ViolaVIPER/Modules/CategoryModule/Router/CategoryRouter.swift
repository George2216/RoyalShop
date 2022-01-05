//
//  CategoryRouter.swift
//  ViolaVIPER
//
//  Created by George on 29.12.2021.
//

import Foundation
import UIKit

class CategoryRouter : CategoryRouterInput {
   
    weak var rootViewController:UIViewController?
    weak var delegate:MainControllerDelegate?

    func goBack() {
        rootViewController?.navigationController?.popViewController(animated: true)
    }
    func returnCetegories(_ array: [Category]) {
        delegate?.categories(array)
        goBack()
    }
    
}
