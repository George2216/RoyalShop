//
//  AboutUsAssemblyy.swift
//  ViolaVIPER
//
//  Created by George on 04.01.2022.
//

import Foundation
import UIKit

class AboutUsAssembly {
    
    static func assembleAboutUsModule() -> UIViewController{
        let view = AboutUsController.instantiate()
        let interactor = AboutUsInteractor()
        let router = AboutUsRouter()
        let presenter = AboutUsPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.rootViewController = view
        return view
        
    }
}
