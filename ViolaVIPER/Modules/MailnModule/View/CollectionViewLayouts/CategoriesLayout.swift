//
//  CategoriesLayout.swift
//  ViolaVIPER
//
//  Created by George on 31.12.2021.
//

import UIKit

class CategoriesLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        filterLayout()
    }
    
    private func filterLayout() {
        self.scrollDirection = .horizontal
        self.minimumLineSpacing = 15
        self.minimumInteritemSpacing = 0
        self.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        self.estimatedItemSize = CGSize(width: 500, height: 40)
        self.itemSize = CGSize(width: 50, height: 40)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
