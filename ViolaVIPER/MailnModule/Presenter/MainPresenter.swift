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
    
    var view:MainControllerInput
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
    func showContacts() {
        
    }
    
    func changeConfiguration() {
        
    }
    
    
    
    
}
// interactor access
extension MainPresenter:MainInteractorOutput {
    
}
