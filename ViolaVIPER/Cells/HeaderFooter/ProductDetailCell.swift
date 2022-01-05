//
//  ProductDetailCell.swift
//  ViolaVIPER
//
//  Created by George on 03.01.2022.
//

import UIKit
import SnapKit

class ProductDetailCell: UICollectionViewCell {
    
    static let priseFont:UIFont = .monospacedSystemFont(ofSize: 20, weight: .heavy)
    static let quantityFont:UIFont = .monospacedSystemFont(ofSize: 18, weight: .medium)
    static let descriptionFont:UIFont = .systemFont(ofSize: 17)
    static let padding = 16
    let identifier = "ProductDetailCellIdentifier"
    
    weak var tapsDelegate:TapsOnDetailMainCell?
    var content:MainDetailContent? {
        didSet {
            guard let content = content else { return }
            priceLabel.text = content.price
            quantityLabel.text = "Наявність:" + content.quantity
            descriptionLabel.text = content.description
        }
    }
    
    private let priceLabel:UILabel = {
        let label = UILabel()
        label.textColor = .systemOrange
        label.font = priseFont
        label.textAlignment = .left
        return label
    }()
    
    
    private let quantityLabel:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        label.font = quantityFont

        return label
    }()
    
    private let descriptionLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = descriptionFont

        return label
    }()
    
    private let callButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "phone.circle.fill"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.tintColor = .systemGreen
        return button
    }()
    
    private let goToBrowserButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrowshape.turn.up.right.circle.fill"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayer()
        setupPriseLabel()
        setupQuantityLabel()
        setupButtons()
        setupDescriptionLabel()
    }
    
    private func setupPriseLabel() {
        contentView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(ProductDetailCell.padding)
            make.trailing.equalToSuperview().inset(ProductDetailCell.padding)
        }
    }
    
    private func setupQuantityLabel() {
        contentView.addSubview(quantityLabel)
        quantityLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).inset(-10)
            make.leading.equalToSuperview().inset(ProductDetailCell.padding)
            make.trailing.equalToSuperview()
        }
    }
    
    private func setupButtons() {
        
        callButton.addTarget(self, action: #selector(tapCall), for: .touchUpInside)
        goToBrowserButton.addTarget(self, action: #selector(tapShowInBrowser), for: .touchUpInside)

        let stack = UIStackView(arrangedSubviews: [callButton,goToBrowserButton])
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        contentView.addSubview(stack)

        stack.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(ProductDetailCell.padding)
            make.height.equalTo(50)
            make.width.equalTo(110)
        }
    }
    
    private func setupDescriptionLabel() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(quantityLabel.snp.bottom).inset(-10)
            make.leading.equalToSuperview().inset(ProductDetailCell.padding)
            make.trailing.equalToSuperview().inset(ProductDetailCell.padding)
        }
    }
    
    private func setupLayer() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 15.0
        self.layer.borderWidth = 0.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.2
        self.layer.masksToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapCall() {
        tapsDelegate?.tapCall()
    }
    @objc func tapShowInBrowser() {
        tapsDelegate?.tapShowInBrowser()

    }
    
}

