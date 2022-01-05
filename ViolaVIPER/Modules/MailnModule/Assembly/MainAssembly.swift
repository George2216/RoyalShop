//
//  MainAssembly.swift
//  ViolaVIPER
//
//  Created by George on 23.12.2021.
//

import UIKit
import Foundation



class MainAssembly {
    static func assembleMainModule() -> UIViewController {
        let apiManager = ApiManager()
        let view = MainController()
        let interactor = MainInteractor(apiManager: apiManager)
        let router = MainRouter()
        router.rootViewController = view
        let presenter = MainPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
}
