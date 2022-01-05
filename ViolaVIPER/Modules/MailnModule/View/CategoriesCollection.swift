//
//  CategoriesCollection.swift
//  ViolaVIPER
//
//  Created by George on 31.12.2021.
//

import UIKit
import SnapKit

class CategoriesCollection: UICollectionView {

    var placholder:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .lightGray
        return label
        
    }()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.preparePlaceholder()
        self.showsHorizontalScrollIndicator = false
    }
    
    private func preparePlaceholder() {
        self.addSubview(placholder)
        placholder.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
