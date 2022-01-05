//
//  CategoryMainCell.swift
//  ViolaVIPER
//
//  Created by George on 31.12.2021.
//

import UIKit
import SnapKit

class CategoryMainCell: UICollectionViewCell {
    let identifier = "CategoryMainCellIdentifier"
    var categoryNameLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    private var deleteImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "xmark")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareLabel()
        prepareDeleteImage()
        uiAdditional()
    }
    
    private func prepareLabel() {
        self.addSubview(categoryNameLabel)
      

        categoryNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(4)
            make.bottom.equalToSuperview().inset(4)
            make.leading.equalToSuperview().inset(10)
        }
    }
    
    
    private func prepareDeleteImage() {
        deleteImage.contentMode = .scaleAspectFit
        self.addSubview(deleteImage)
        deleteImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
            make.leading.equalTo(categoryNameLabel.snp.trailing).inset(-10)
            make.width.equalTo(20)
            make.height.equalTo(20)

        }
}
    private func uiAdditional(){
        self.backgroundColor = #colorLiteral(red: 0.9334705472, green: 0.9279213548, blue: 0.9377360344, alpha: 1)
        self.layer.cornerRadius = (categoryNameLabel.font.pointSize + 8 ) / 2
        self.clipsToBounds = true
        self.layer.borderWidth = 1.0
        self.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.24)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
