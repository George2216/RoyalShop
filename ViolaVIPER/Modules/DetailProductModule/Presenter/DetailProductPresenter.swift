//
//  DetailProductPresenter.swift
//  ViolaVIPER
//
//  Created by George on 02.01.2022.
//

import Foundation


class DetailProductPresenter {
    weak var view: DetailProductControllerInput?
    var interactor: DetailProductInteractorInput
    var router: DetailProductRouterInput
    
    
    init(view: DetailProductControllerInput,interactor:DetailProductInteractorInput,router:DetailProductRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension DetailProductPresenter: DetailProductControllerOutput {
    
    func shareProduct() {
        interactor.shareProduct()
    }
    
    func content(data:DetailProductModel) {
        view?.content = data
        interactor.content = data
    }
    
    func goToBrowser() {
        interactor.goToBrowser()
    }
    
    func makeACall() {
        interactor.makeACall()
    }
    
    func goBack() {
        router.goBack()
    }
}

extension DetailProductPresenter: DetailProductInteractorOutput {
    
    func shareProduct(width: [Any]) {
        router.shareProduct(shareItems: width)
    }
    
    
}
