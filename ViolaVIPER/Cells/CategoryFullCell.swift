//
//  CategoryMainCell.swift
//  ViolaVIPER
//
//  Created by George on 29.12.2021.
//

import UIKit
import SnapKit

class CategoryFullCell: UITableViewCell {
    var cellIdentifier = "CategoryFullCellIdentifier"
    var categoryNameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AlNile", size: 18)
        label.numberOfLines = 0
        return label
    }()
    
    
    var selectedImage:UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none

        prepareCategoryLabel()
        prepareSelectedImage()
    }
    
 
    private func prepareCategoryLabel() {
        self.contentView.addSubview(categoryNameLabel)
        
        categoryNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)

            make.leading.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(40)
        }
    }
    
    private func prepareSelectedImage() {
        self.contentView.addSubview(selectedImage)
        
        selectedImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(25)
            make.height.equalTo(25)
            make.trailing.equalToSuperview().inset(5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
