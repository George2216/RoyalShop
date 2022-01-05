//
//  ProductListCell.swift
//  ViolaVIPER
//
//  Created by George on 27.12.2021.
//

import UIKit

class ProductListCell: UICollectionViewCell , ProductCellProtocol {
    var cellIdentifier = "ProductListCellIdentifier"
    var productImage :UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    var title: UILabel =  {
        let label = UILabel()
        label.font = UIFont(name: "AlNile-Bold", size: 16)
        label.numberOfLines = 2
        label.contentMode = .topLeft
        return label
    }()
    
    var manufacturer:UILabel =  {
        let label = UILabel()
        label.textAlignment = .left

        return label
    }()
    
    var prise:UILabel =  {
        let label = UILabel()
        label.textColor = .systemOrange
        label.font = UIFont(name: "Arial-BoldMT", size: 18)

        label.textAlignment = .left
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
        self.addSubview(productImage)
        productImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.leading.equalToSuperview().inset(5)
            make.width.equalTo(120)
            make.height.equalTo(120)
        }
    }
    private func setupeTitle() {
        self.addSubview(title)
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.leading.equalTo(productImage.snp.trailing).inset(-15)
            make.trailing.equalToSuperview().inset(5)

        }
    }
    
    
    private func setupeManufacturer() {
        self.addSubview(manufacturer)
        manufacturer.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom)
            make.leading.equalTo(title)
            make.trailing.equalToSuperview()

        }
    }
    
    private func setupePrice() {
        self.addSubview(prise)
        prise.snp.makeConstraints { make in
            make.top.equalTo(manufacturer.snp.bottom).inset(-10)
            make.leading.equalTo(title)
            make.trailing.equalToSuperview()
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
