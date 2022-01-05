//
//  ViewController.swift
//  ViolaVIPER
//
//  Created by George on 23.12.2021.
//

import UIKit
import SnapKit
import SDWebImage

protocol ProductCellProtocol {
    var cellIdentifier:String { get }
    var title: UILabel {get set}
    var productImage :UIImageView {get set}
    var manufacturer:UILabel {get set}
    var prise:UILabel {get set}
}

typealias CellType = UICollectionViewCell & ProductCellProtocol

class MainController: UIViewController , MainControllerInput {
   
    
    var categoriesPlaceholder:String = String() {
        didSet {
            categoriesCollection.placholder.text = categoriesPlaceholder
        }
    }
    
    var presenter: MainControllerOutput?
    
    var cellType:CellType.Type = ProductDefaultCell.self {
        didSet {
            self.productsCollection.reloadSections(IndexSet.init(arrayLiteral: 0))
        }
    }
    
    var products: [NeededProductData] = [] {
        didSet {
            productsCollection.reloadData()
        }
    }
    var categoriesContent: [String] = [] {
        didSet {
            categoriesCollection.reloadData()
            
        }
    }
    
    private let categoryButton = CategoryButton()

    private var productsCollection = MainCollectionViewProduct(frame: .zero, collectionViewLayout: .init())
    private var categoriesCollection = CategoriesCollection(frame: .zero, collectionViewLayout: .init())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        prepareCategoryButton()
        createSearchBar()
        createConfigurationButton()
        createContactsButton()
        prepareProductCollection()
        prepareCategoriesCollection()

    }
    
    private func prepareCategoryButton() {
        categoryButton.setTitle("Категорії", for: .normal)
        self.view.addSubview(categoryButton)
        
        
        categoryButton.addTarget(self, action: #selector(tapCategoryButton), for: .touchUpInside)
        
        categoryButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview()
            make.width.equalTo(100)
        }
    }
    
    private func createSearchBar() {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Пошук товарів"
        searchBar.keyboardType = .default
        searchBar.searchTextField.delegate = self
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
        productsCollection.delegate = self
        productsCollection.dataSource = self
        
        productsCollection.register(ProductDefaultCell.self, forCellWithReuseIdentifier: ProductDefaultCell().cellIdentifier)
        productsCollection.register(ProductListCell.self, forCellWithReuseIdentifier: ProductListCell().cellIdentifier)
        productsCollection.keyboardDismissMode = .interactive
        productsCollection.customLayout = .standart // set layout
        
        self.view.addSubview(productsCollection)
        
        productsCollection.snp.makeConstraints { make in
            make.top.equalTo(categoryButton.snp.bottom).inset(-10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func prepareCategoriesCollection() {
        categoriesCollection.placholder.text = "Усі"
        categoriesCollection.delegate = self
        categoriesCollection.dataSource = self
        categoriesCollection.setCollectionViewLayout(CategoriesLayout(), animated: true)
        
        categoriesCollection.register(CategoryMainCell.self, forCellWithReuseIdentifier: CategoryMainCell().identifier)
        
        self.view.addSubview(categoriesCollection)
        
        categoriesCollection.snp.makeConstraints { make in
            make.top.equalTo(categoryButton)
            make.bottom.equalTo(categoryButton)
            make.leading.equalTo(categoryButton.snp.trailing)
            make.trailing.equalToSuperview()
        }
    }
    
    private func setupProductCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.init().cellIdentifier, for: indexPath) as? CellType else {
            return .init()
        }
        cell.manufacturer.text = products[indexPath.row].manufacturer
        cell.title.text = products[indexPath.row].title
        cell.prise.text = products[indexPath.row].price
        cell.productImage.sd_setImage(with: URL(string: products[indexPath.row].image), placeholderImage: UIImage.placeholderImage())
        return cell
    }
    
    private func setupCategoryCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryMainCell().identifier, for: indexPath) as? CategoryMainCell else {
            return .init()
        }
        cell.layoutIfNeeded()
        cell.categoryNameLabel.text = categoriesContent[indexPath.row]
        return cell
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
    
    @objc func tapCategoryButton() {
        presenter?.showCategories()
    }
   
    
    
}

// required methods
extension MainController {
    
    func changeLayout(_ on: ConfigurationStyle) {
        productsCollection.customLayout = on
    }
    
    func changeImageName(_ on: String) {
        self.navigationItem.leftBarButtonItem?.image = UIImage(systemName: on)
    }
    
    func usedDefaultCell() {
        cellType = ProductDefaultCell.self
    }
    
    func usedLineCell() {
        cellType = ProductListCell.self
    }
}

extension MainController:UICollectionViewDelegateFlowLayout , UICollectionViewDataSource , UITextFieldDelegate {
    
    //  collection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == productsCollection {
            return products.count
        } else if collectionView == categoriesCollection {
            return categoriesContent.count
        }
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == productsCollection {
            return setupProductCell(collectionView, cellForItemAt: indexPath)
        } else if collectionView == categoriesCollection {
            return setupCategoryCell(collectionView, cellForItemAt: indexPath)
        }
        
        return .init()
   
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if  collectionView == productsCollection {
            presenter?.showDetailProduct(index: indexPath.row)
        } else if collectionView == categoriesCollection {
            presenter?.removeCategory(for: indexPath.row)
        }
         
    }
    
    // text fild
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        presenter?.searchText(textField.text ?? "" )
    }
    
    
}

// custom delegate methods
extension MainController:MainControllerDelegate {
    
    func categories(_ array: [Category]) {
        presenter?.selectedCategories(array)
    }
}
