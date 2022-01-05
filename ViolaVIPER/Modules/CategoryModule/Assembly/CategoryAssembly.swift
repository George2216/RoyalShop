//
//  CategoryAssembly.swift
//  ViolaVIPER
//
//  Created by George on 29.12.2021.
//

import Foundation
import UIKit

class CategoryAssembly {
    
    static func assembleCategoryModule(selectedCategories:[Category],mainDelegate:MainControllerDelegate) -> UIViewController {
        let apiManager = ApiManager()
        let view = CategoryController(style: .plain)
        let interactor = CategoryInteractor(apiManager: apiManager)
        let router = CategoryRouter()
        let presenter = CategoryPresenter(view: view, interactor: interactor, router: router)
        router.delegate = mainDelegate
        router.rootViewController = view
        view.presenter = presenter
        interactor.presenter = presenter
        interactor.selected = selectedCategories.map{$0.id}
        return view
    }
}
