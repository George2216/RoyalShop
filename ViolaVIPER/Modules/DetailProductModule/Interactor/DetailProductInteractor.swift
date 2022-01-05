//
//  DetaolProductInteractor.swift
//  ViolaVIPER
//
//  Created by George on 02.01.2022.
//

import Foundation
import UIKit

class DetailProductInteractor:DetailProductInteractorInput {
    
   
    
    var presenter: DetailProductInteractorOutput?

    var content: DetailProductModel = DetailProductModel()
    private let contactData = ContactData()

    
    func makeACall() {
        contactData.contactPhone.makeACall()
    }
    
    func goToBrowser() {
        LinkOperations.tryURL(urls: [content.link]) // maybe not good
    }
    
    func shareProduct() {
        presenter?.shareProduct(width: [content.link])
    }
    
  
}
