//
//  DetailProductAssembly.swift
//  ViolaVIPER
//
//  Created by George on 02.01.2022.
//

import Foundation
import UIKit

class DetailProductAssembly {
    
    static func assembleDetailModule(data:DetailProductModel) -> UIViewController {
        let view = DetailProductController(collectionViewLayout: StretchyHeaderLayout())
        let interactor = DetailProductInteractor()
        let router = DetailProductRouter()
        let presenter = DetailProductPresenter(view: view, interactor: interactor, router: router)
        presenter.content(data: data)
        view.presenter = presenter
        router.rootViewController = view
        interactor.presenter = presenter
        return view
    }
    
}
