//
//  CategoryController.swift
//  ViolaVIPER
//
//  Created by George on 29.12.2021.
//

import UIKit

class CategoryController: UITableViewController , CategoryControllerInput {
    var tableContent: [CategoriesTableData] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var presenter: CategoryContollerOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Категорії"
        prepareTable()
        saveUnselectButtons()
        backButton()
    }
    deinit {
        print("Category module deinit")
    }
    private func saveUnselectButtons() {
        let saveButton = UIBarButtonItem(image: UIImage(systemName: "checkmark"), style: .done, target: self, action:  #selector(tapSave))
        
        let unselectButton = UIBarButtonItem(image: UIImage(systemName: "checklist"), style: .done, target: self, action: #selector(removeAll))
                navigationItem.rightBarButtonItems = [saveButton,unselectButton]
    }

    private func backButton() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(goBack))
        navigationItem.leftBarButtonItem = backButton

    }
    
   
    
    private func prepareTable() {
        tableView.register(CategoryFullCell.self, forCellReuseIdentifier: CategoryFullCell().cellIdentifier)
    }
}
// actions
extension CategoryController {
    
    @objc func tapSave() {
        presenter?.tapSave()
    }
    
    @objc func goBack() {
        presenter?.goBack()

    }
    @objc func removeAll() {
        presenter?.removeAll()
    }
}

extension CategoryController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableContent.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryFullCell().cellIdentifier, for: indexPath) as? CategoryFullCell else {
            return .init(frame: .zero)
        }
        let imageName = tableContent[indexPath.row].isSelected ?   "circle.inset.filled" : "circle"
        cell.categoryNameLabel.text = tableContent[indexPath.row].name
        cell.selectedImage.image = UIImage(systemName: imageName)
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.itemSelected(indexPath.row)
    }
}
