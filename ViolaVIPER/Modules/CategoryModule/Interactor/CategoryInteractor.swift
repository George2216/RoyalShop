//
//  CategoryInteractor.swift
//  ViolaVIPER
//
//  Created by George on 29.12.2021.
//

import Foundation

class CategoryInteractor: CategoryInteractorInput {
   
    private var num = 0 // calculate complexity
    
    var presenter:CategoryInteractorOutput?
    var apiManager:ApiManagerContract
    
    var selected:[String] = [] {
        didSet {
            self.addSelectedIcon()
        }
    }
    var tableContent:[CategoriesTableData] = [] {
        didSet {
            presenter?.addTableContent(tableContent)
        }
    }
    
    var categories:[CategoriesData] = [] {
        didSet {
            self.addSelectedIcon()
        }
    }
    
    func selectedItem(_ row: Int) {
        guard let categoryId = categories[row].category_id else { return }
        let selectedIndex = selected.firstIndex(of: categoryId)
        if let index = selectedIndex {
            self.selected.remove(at: index)
        } else {
            self.selected.append(categoryId)
        }
    }
    
    
    func tapSave() -> [Category] {
        if selected.count == tableContent.count {
            return []
        }
        let content = selected.map { categoryId -> Category in
            let names = tableContent.filter {item  in
                 item.category_id == categoryId
            }
            
            return Category(name: names[0].name, id: categoryId)
        }
        return content
    }
    
    func removeAll() {
        guard !selected.isEmpty else { return }
        let singleElement = selected[0]
        selected = [singleElement]
    }
    
   
    
    init(apiManager:ApiManagerContract) {
        self.apiManager = apiManager
        self.getCategories()
    }
    
   
}

// private
extension CategoryInteractor {
    
    private func getCategories() {
        if let inputData = try? JSONEncoder().encode(CategoriesBody())  {
            apiManager.sendRequest(type: CategoriesOutput.self, method: .POST, requestType: .getCategories, data: inputData) {[weak self] data, error in
                guard let self = self else { return }

            guard error == nil else {
                print(error.debugDescription)
                return
            }
                self.categories = data?.data ?? []
            }
        }
    }
    
    private func addSelectedIcon() {
        let isEmpty = selected.isEmpty
        var newSelected:[String] = []
        let tableContent = categories.map { item -> CategoriesTableData  in
            num += 1
            print( num)
            
            if isEmpty {
                newSelected.append(item.category_id ?? "")
            }
            
            let isSelected = isEmpty ? true : selected.contains(item.category_id ?? "")
            
            return CategoriesTableData(category_id: item.category_id ?? "", image: item.image ?? "" , name: item.name ?? "" , isSelected: isSelected)
        }
        if !newSelected.isEmpty {
            selected = newSelected
        }
        
        self.tableContent = tableContent
    }
    
}
