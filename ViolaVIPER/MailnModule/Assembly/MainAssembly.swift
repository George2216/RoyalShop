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
        let view = MainController()
        let interactor = MainInteractor()
        let router = MainRouter()
        let presenter = MainPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
            return view
    }
}
