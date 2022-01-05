//
//  DefualtCollectionViewLayout.swift
//  ViolaVIPER
//
//  Created by George on 27.12.2021.
//

import Foundation
import UIKit
class StandartCollectionViewLayout:UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        standartLayout()
    }
    
     func standartLayout() {
        self.scrollDirection = .vertical
        self.itemSize = CGSize(width:( UIScreen.main.bounds.width / 2 ) - 20, height: 270)
        self.minimumInteritemSpacing = 20
        self.minimumLineSpacing = 20
        self.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BigCollectionViewLayout:UICollectionViewFlowLayout {
   
    override init() {
        super.init()
        bigLayout()
    }
    
    func bigLayout() {
        self.scrollDirection = .vertical
        self.itemSize = CGSize(width: UIScreen.main.bounds.width  - 20, height: 270)
        self.minimumInteritemSpacing = 20
        self.minimumLineSpacing = 20
        self.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class ListCollectionViewLayout:UICollectionViewFlowLayout {
    override init() {
        super.init()
        listLayout()
    }
    
    func listLayout() {
        self.scrollDirection = .vertical
        self.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: 130)
        self.minimumInteritemSpacing = 20
        self.minimumLineSpacing = 20
        self.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
