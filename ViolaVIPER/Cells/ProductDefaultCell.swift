//
//  ProductDefaultCell.swift
//  ViolaVIPER
//
//  Created by George on 24.12.2021.
//

import UIKit
import SnapKit

class ProductDefaultCell: UICollectionViewCell , ProductCellProtocol {
    var cellIdentifier = "ProductDefaultCellIdentifier"
    var productImage :UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    var title: UILabel =  {
        let label = UILabel()
        label.font = UIFont(name: "AlNile-Bold", size: 16)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    var manufacturer:UILabel =  {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    var prise:UILabel =  {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .systemOrange
        label.font = UIFont(name: "Arial-BoldMT", size: 18)

        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        layerPrepare()
        setupeImage()
        setupeTitle()
        setupeManufacturer()
        setupePrice()
    }
    
    private func setupeImage() {
        productImage.autoresizingMask = .flexibleHeight
        self.addSubview(productImage)
        productImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(160)
        }
    }
    private func setupeTitle() {
        self.addSubview(title)
        title.snp.makeConstraints { make in
            make.top.equalTo(productImage.snp.bottom).inset(-10)
            make.leading.equalToSuperview().inset(5)
            make.trailing.equalToSuperview().inset(5)
        }
    }
    
    
    private func setupeManufacturer() {
        self.addSubview(manufacturer)
        manufacturer.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).inset(2)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()

        }
    }
    
    private func setupePrice() {
        self.addSubview(prise)
        prise.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
    
    private func layerPrepare() {
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
