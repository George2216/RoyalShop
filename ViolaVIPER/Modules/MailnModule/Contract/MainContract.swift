//
//  Contract.swift
//  ViolaVIPER
//
//  Created by George on 23.12.2021.
//

import Foundation

protocol MainControllerInput {
    var presenter:MainControllerOutput? { get set }
    var products: [NeededProductData] { get set }
    var categoriesPlaceholder:String { get set }
    var categoriesContent:[String] { get set }
    func changeLayout(_ on:ConfigurationStyle)
    func changeImageName(_ on:String)
    func usedDefaultCell()
    func usedLineCell()

}
protocol MainControllerDelegate:AnyObject {
    func categories(_ array:[Category])
}


protocol MainRouterInput {
    func showCategoryModule(_ selectedCategories:[Category])
    func showDetailProductModule(data:DetailProductModel)
    func showContacts()
}

protocol MainInteractorInput {
    var presenter:MainInteractorOutput? { get set }
    var currentСonfiguration:ConfigurationStyle { get set }
    func changeConfigration()
    var searchText:String { get set }
    var selectedCategories:[Category] { get set }
    func removeCategory(for index: Int)
    func getDatailData(index:Int) -> DetailProductModel
}


// presenter

protocol MainControllerOutput {
    func changeConfiguration()
    func showContacts()
    func searchText(_ text:String)
    func showCategories()
    func selectedCategories(_ array:[Category])
    func removeCategory(for index:Int)
    func showDetailProduct(index:Int)
}

protocol MainInteractorOutput {
    
    func getProducts(_ products:[NeededProductData])
    
    func changeLayout(_ on:ConfigurationStyle)
    func categoriesPlaceholter(_ text: String)
    func relodCategories(_ array:[String])

}

protocol MainRouterOutput {
    func showCategories(_ categories:[Category])
}
