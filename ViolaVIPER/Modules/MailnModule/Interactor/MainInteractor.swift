//
//  MainInteractor.swift
//  ViolaVIPER
//
//  Created by George on 23.12.2021.
//

import Foundation

class MainInteractor:MainInteractorInput {
    
    var presenter: MainInteractorOutput?
    var apiManager:ApiManagerContract
    
    var selectedCategories:[Category] = [] {
        didSet {
            presenter?.categoriesPlaceholter(getCategoriesPlaceholder())
            presenter?.relodCategories(selectedCategories.map{$0.name})
            presenter?.getProducts(getSortedContent())

        }
    }
    
    var currentСonfiguration:ConfigurationStyle = .standart {
        didSet {
            presenter?.changeLayout(currentСonfiguration)
        }
    }
    
    var products:[AllProductsData] = [] {
        didSet {
            presenter?.getProducts(getSortedContent())
        }
    }
    var searchText:String = "" {
        didSet {
            presenter?.getProducts(getSortedContent())
        }
    }
    
    
    init(apiManager:ApiManagerContract) {
        self.apiManager = apiManager
        getProducts()
    }
    
    func changeConfigration() {
        switch currentСonfiguration {
        case .standart:
            currentСonfiguration = .line
        case .line:
            currentСonfiguration = .big
        case .big:
            currentСonfiguration = .standart
        }
    }
  
    func removeCategory(for index: Int) {
        selectedCategories.remove(at: index)
    }
    
    func getDatailData(index:Int) -> DetailProductModel {
        let data = getSortedAllContent()[index]
        return DetailProductModel(title: data.title ?? "", image: data.image ?? "", price: "\(data.price ?? "") грн", link: data.link ?? "" , description: data.description ?? "", quantity:data.quantity ?? "", manufacturer: data.manufacturer ?? "" , categoryName: data.category_name ?? "")
    }
}



// private data

extension MainInteractor {
    
    private func getProducts() {
        apiManager.sendRequest(type: [AllProductsData].self,
                               method: .GET,
                               requestType: .getItems,
                               data: nil) { [weak self] data, error in
            
            guard let self = self else { return }

            guard error == nil else {
                print(error!)
                return
            }
            
            guard var data = data else { return }
            
            data = data.map { item in
                var content = item
                let image = item.image?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                content.image = image
                return content
            }
            
            self.products = data
        }
        
    }
    
    private func convertAllProducsToNeeded(_ products:[AllProductsData]) -> [NeededProductData] {
        let output = products.map { item -> NeededProductData in
            

            return NeededProductData(title: item.title ?? "" , image: item.image ?? "" , price: "\(item.price ?? "") грн", manufacturer:  item.manufacturer ?? "", quantity: item.quantity ?? "")
        }
            return output
    }
    
    private func filteringContent(_ products:[AllProductsData]) -> [AllProductsData] {
        let filteringResult = products.filter { item in
            if searchText.isEmpty {
                return true
            }
            guard let name = item.name_item else {return false}
            return name.lowercased().contains(searchText.lowercased())
        }
        return filteringResult
    }
    
    private func getCategoriesPlaceholder() -> String {
        if selectedCategories.isEmpty {
            return "Усі"
        }
        return ""
    }
    
    private func sortedProductsByCategories(_ products:[AllProductsData]) -> [AllProductsData] {
        if selectedCategories.isEmpty {
             return products
        }
       let sortedProducts =  products.filter { item in
           return  selectedCategories.map{$0.id}.contains(item.category_id)
        }
        return sortedProducts
    }
    
    private func getSortedContent() -> [NeededProductData] {
        convertAllProducsToNeeded(sortedProductsByCategories(filteringContent(products)))
    }
    
    private func getSortedAllContent() -> [AllProductsData] {
          sortedProductsByCategories(filteringContent(products))
    }
    
}

