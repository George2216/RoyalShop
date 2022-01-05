//
//  MainRouter.swift
//  ViolaVIPER
//
//  Created by George on 23.12.2021.
//

import Foundation
import UIKit
class MainRouter: MainRouterInput {
   
    
    
    
    
    weak var rootViewController:UIViewController?
    
    func showCategoryModule(_ selectedCategories:[Category]) {
        rootViewController?.navigationController?.pushViewController(CategoryAssembly.assembleCategoryModule(selectedCategories: selectedCategories, mainDelegate: rootViewController as! MainControllerDelegate), animated: true)
    }
    
    func showDetailProductModule(data: DetailProductModel) {
        let nav = UINavigationController(rootViewController: DetailProductAssembly.assembleDetailModule(data: data))
        nav.navigationBar.prefersLargeTitles = false
        nav.modalPresentationStyle = .overFullScreen
        rootViewController?.navigationController?.present(nav, animated: true,completion: nil)
    }
    
    func showContacts() {
        let contacts = AboutUsAssembly.assembleAboutUsModule()
        rootViewController?.navigationController?.pushViewController(contacts, animated: true)
    }
    
    
}
