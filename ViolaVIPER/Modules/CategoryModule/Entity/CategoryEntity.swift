//
//  CategoryEntity.swift
//  ViolaVIPER
//
//  Created by George on 29.12.2021.
//

import Foundation

struct CategoriesOutput: Codable {
    var data:[CategoriesData]
}

struct CategoriesData:Codable {
    var category_id:String?
    var image:String?
    var name:String?
}

struct CategoriesTableData {
    var category_id:String
    var image:String
    var name:String
    var isSelected:Bool
}

struct Category {
    var name:String
    var id:String
}
