//
//  MainEntity.swift
//  ViolaVIPER
//
//  Created by George on 23.12.2021.
//

import Foundation
import UIKit


struct AllProductsData:Codable {
    let id:String?
    let name_item:String?
    let model:String?
    let quantity:String?
    var price:String?
    let title:String?
    var image:String?
    let description:String?
    let manufacturer:String?
    let link:String?
    let category_id:String?
    let category_name:String?
}

struct NeededProductData {
    let title:String
    let image:String
    let price:String
    let manufacturer:String?
    let quantity:String
}

struct DetailProductModel {
    let title:String
    let image:String
    let price:String
    let link:String
    let description:String
    let quantity:String
    let manufacturer:String
    let categoryName:String
    
    init() {
        title = ""
        image = ""
        price = ""
        link = ""
        description = ""
        quantity = ""
        manufacturer = ""
        categoryName = ""
    }

    init(title:String,image:String, price:String,link:String,description:String,quantity:String,manufacturer:String,
         categoryName:String) {
        self.title = title
        self.image = image
        self.price = price
        self.link = link
        self.description = description
        self.quantity = quantity
        self.manufacturer = manufacturer
        self.categoryName = categoryName
    }
}
