//
//  CategoryPresenter.swift
//  ViolaVIPER
//
//  Created by George on 29.12.2021.
//

import Foundation



class CategoryPresenter {
    var view: CategoryControllerInput
    var interactor:CategoryInteractorInput
    var router:CategoryRouterInput
    
    
    init(view: CategoryControllerInput,interactor:CategoryInteractorInput,router:CategoryRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension CategoryPresenter:CategoryContollerOutput {
    func removeAll() {
        interactor.removeAll()
    }
    
    func itemSelected(_ row: Int) {
        interactor.selectedItem(row)
    }
    
    func tapSave() {
        router.returnCetegories(interactor.tapSave())
    }
    
    func goBack() {
        router.goBack()
    }
    
    
}


extension CategoryPresenter:CategoryInteractorOutput {
    func addTableContent(_ content: [CategoriesTableData]) {
        DispatchQueue.main.async {
            self.view.tableContent = content

        }
    }
    
    
}
