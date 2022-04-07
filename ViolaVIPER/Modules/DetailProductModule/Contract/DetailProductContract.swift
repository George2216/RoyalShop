//
//  DetailProductContract.swift
//  ViolaVIPER
//
//  Created by George on 02.01.2022.
//

import Foundation

protocol DetailProductControllerInput: NSObject {
    var presenter:DetailProductControllerOutput? { get set }
    var content:DetailProductModel { get set }
}

protocol DetailProductInteractorInput {
    var presenter:DetailProductInteractorOutput? { get set }
    var content:DetailProductModel { get set }

    func makeACall()
    func goToBrowser()
    func shareProduct()

}
 
protocol DetailProductRouterInput {
    func goBack()
    func shareProduct(shareItems: [Any])
    
}


// presenter
protocol DetailProductControllerOutput {
    func goBack()
    func makeACall()
    func goToBrowser()
    func shareProduct()

}

protocol DetailProductInteractorOutput {
    func shareProduct(width:[Any])
}

protocol TapsOnDetailMainCell: AnyObject {
    func tapCall()
    func tapShowInBrowser()
}
