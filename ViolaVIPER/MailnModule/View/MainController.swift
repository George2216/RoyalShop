//
//  ViewController.swift
//  ViolaVIPER
//
//  Created by George on 23.12.2021.
//

import UIKit
import SnapKit


class MainController: UIViewController , MainControllerInput {
    var presenter: MainControllerOutput?

    private var productsCollection = UICollectionView(frame: .zero, collectionViewLayout: .init())
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        prepareCategoryButton()
        createSearchBar()
        createConfigurationButton()
        createContactsButton()
    }

    
    private func prepareCategoryButton() {
        let categoryButton = CategoryButton()
        categoryButton.setTitle("Категорії", for: .normal)
        self.view.addSubview(categoryButton)
        
        categoryButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview()
            make.width.equalTo(100)
        }
    }
    
    private func createSearchBar() {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Пошук товарів"
        self.navigationItem.titleView = searchBar
    }
    
    
    
    private func createConfigurationButton() {
        let configurationButton = UIBarButtonItem(image: UIImage(systemName: ConfigurationStyle.standart.imageName), style: .done, target: self, action: #selector(tapConfigurationButton))
        
        self.navigationItem.leftBarButtonItem =  configurationButton
        
    }
    
    private func createContactsButton() {
        let contactsButton = UIBarButtonItem(image: UIImage(systemName: "bubble.left.and.bubble.right"), style: .done, target: self, action: #selector(tapShowContactButton))
        self.navigationItem.rightBarButtonItem = contactsButton
    }
    
    
    
    
    
    private func prepareProductCollection() {
        
        
        
    }
    
    
    

}


// actions

extension MainController {
    
    @objc func tapConfigurationButton() {
        presenter?.changeConfiguration()
    }
    
    @objc func tapShowContactButton() {
        presenter?.showContacts()
    }
    
    
}
