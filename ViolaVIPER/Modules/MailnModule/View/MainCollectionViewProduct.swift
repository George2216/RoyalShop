//
//  MainCollectionViewProduct.swift
//  ViolaVIPER
//
//  Created by George on 28.12.2021.
//

import UIKit
import SnapKit

class MainCollectionViewProduct: UICollectionView {
    
    var customLayout:ConfigurationStyle = .standart {
        didSet {
            switch customLayout {
            case .standart:
                standartLayout()
            case .big:
                bigLayout()
            case .line:
                listLayout()
            }
        }
    }
 
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    private func standartLayout() {
        let layout = StandartCollectionViewLayout()
        self.setCollectionViewLayout(layout, animated: true)
    }
    
    private func bigLayout() {
        let layout = BigCollectionViewLayout()
        self.setCollectionViewLayout(layout, animated: true)
    }
    
    
    private  func listLayout() {
        let layout = ListCollectionViewLayout()
        self.setCollectionViewLayout(layout, animated: true)
    }
    
    
}
