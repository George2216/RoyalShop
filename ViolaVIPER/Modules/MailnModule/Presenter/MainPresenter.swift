//
//  MainPresenter.swift
//  ViolaVIPER
//
//  Created by George on 23.12.2021.
//

import Foundation

enum ConfigurationStyle:String {
case standart
case big
case line
    
    var imageName:String {
        switch self {
        case .standart:
            return "square.fill.text.grid.1x2"
        case .big:
            return "square.grid.2x2.fill"
        case .line:
            return "square.and.line.vertical.and.square.fill"
        }
    }
}


class MainPresenter {
    
    weak var view:MainControllerInput?
    var interactor:MainInteractorInput
    var router:MainRouterInput
    
    init(view:MainControllerInput,interactor:MainInteractorInput,router:MainRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
        
    }
    
}

// controller access
extension MainPresenter:MainControllerOutput {
  
    
    
    func removeCategory(for index: Int) {
        interactor.removeCategory(for: index)
    }
    
    func selectedCategories(_ array: [Category]) {
        interactor.selectedCategories = array
        view?.categoriesContent = array.map{ $0.name }
    }
    
   
    
    func searchText(_ text: String) {
        interactor.searchText = text
    }
    func changeConfiguration() {
        interactor.changeConfigration()
    }
    
    func showCategories() {
        router.showCategoryModule(interactor.selectedCategories)
    }
    
    func showContacts() {
        router.showContacts()
    }
    
    func showDetailProduct(index: Int) {
        router.showDetailProductModule(data: interactor.getDatailData(index: index))
    }
   
    
    
    
    
}

// interactor access
extension MainPresenter:MainInteractorOutput {
   
    
    func relodCategories(_ array: [String]) {
        view?.categoriesContent = array
    }
    
    func changeLayout(_ on: ConfigurationStyle) {
        view?.changeImageName(on.imageName)
        view?.changeLayout(on)
        
        switch on {
        case .line:
            view?.usedLineCell()
        default:
            view?.usedDefaultCell()
        }
    }
    
    
    func getProducts(_ products: [NeededProductData]) {
        DispatchQueue.main.async {
            self.view?.products = products
        }
    }
    
    func categoriesPlaceholter(_ text: String) {
        view?.categoriesPlaceholder = text
    }
    
}
