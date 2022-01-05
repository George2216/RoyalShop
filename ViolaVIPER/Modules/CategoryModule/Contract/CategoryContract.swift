//
//  CategoryContract.swift
//  ViolaVIPER
//
//  Created by George on 29.12.2021.
//

import Foundation

protocol CategoryControllerInput {
    var presenter:CategoryContollerOutput? { get set }
    var tableContent:[CategoriesTableData] { get set }
}


protocol CategoryInteractorInput {
    var presenter:CategoryInteractorOutput? { get set }
    func selectedItem(_ row:Int)
    func tapSave() -> [Category]
    func removeAll()
    
}

// presenter

protocol CategoryContollerOutput {
    
    func itemSelected(_ row:Int)
    func tapSave()
    func goBack()
    func removeAll()
}

protocol CategoryInteractorOutput {
    func addTableContent(_ content:[CategoriesTableData])
}


protocol CategoryRouterInput {
    func goBack()
    func returnCetegories(_ array:[Category])
}
