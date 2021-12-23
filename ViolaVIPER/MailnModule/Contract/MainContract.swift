//
//  Contract.swift
//  ViolaVIPER
//
//  Created by George on 23.12.2021.
//

import Foundation

protocol MainControllerInput {
    var presenter:MainControllerOutput? { get set }
}

protocol MainRouterInput {
    
}

protocol MainInteractorInput {
    var presenter:MainInteractorOutput? { get set }

}


// presenter

protocol MainControllerOutput {
    func changeConfiguration()
    func showContacts()
}

protocol MainInteractorOutput {
    
}
